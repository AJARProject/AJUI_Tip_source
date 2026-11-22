# Analyse d'AJUI Tip (migration 4D 21 R4)

Composant 4D d'AJAR SA. Dépôt `AJARProject/AJUI_Tip_source`. Licence MIT, fichier `license`. Version après migration : **1.8.0** (4D 21 R4) ; `AJUI_Tip_info` renvoie `AJUI_Tip (v21 R4) : 1.8.0`. Avant la migration, la version était `1.7.2+Build47`, construite avec 4D 19 R7 (commit c39c02c « Build 1.7.2 with 19 R7 », tags existants `1.7.0` et `1.7.2+Build47`).

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.

## Ce que fait le composant

AJUI Tip affiche une bulle d'aide à côté d'un objet de formulaire (la « cible »). La bulle est dessinée en SVG (composant 4D SVG) puis affichée soit comme image, soit dans un sous-formulaire dupliqué (`AJUI_Tip_container`, `OBJECT DUPLICATE` + `OBJECT SET SUBFORM`).

L'hôte crée une instance avec `New AJUI_Tip` (objet dont les membres sont des `Formula` vers les méthodes `AJUI_Tip_set*`, qui servent à la fois de setter et de getter selon `Count parameters`), ou avec la classe `cs.Tip` renvoyée par `AJUI_Tip`. Les instances sont référencées dans la variable interprocess `<>AJUI_Tip_Storage` et dans `Storage.AJUI_Tip_Storage`. Les animations (clignotement, saut, fondu, durée) tournent dans des workers (`CALL WORKER`, `KILL WORKER`) et redessinent le formulaire par `CALL FORM`.

## Structure

| Emplacement | Rôle |
| --- | --- |
| `Project/AJUI_Tip.4DProject` | Projet du composant. Avant migration : seulement le commentaire 4D. Maintenant `compatibilityVersion` 2140 et `tokenizedText` false. |
| `Project/Sources/Methods` | 95 méthodes projet. |
| `Project/Sources/Classes/Tip.4dm` | Classe `Tip` (setters/getters qui appellent les méthodes `AJUI_Tip_set*`). |
| `Project/Sources/Forms` | `AJUI_Tip_container` (sous-formulaire de la bulle) et cinq formulaires de test `zz_*`. |
| `Project/Sources/dependencies.json` | **Nouveau.** Déclare 4D SVG (`github: 4d/4D-SVG`). |
| `Settings/buildApp.4DSettings` | **Nouveau.** Construction du composant (`BuildComponent` True, nom `AJUI_Tip`). Le `.gitignore` ignorait ce fichier ; la ligne a été retirée. |
| `Documentation/Methods` | Fiches markdown des 5 méthodes partagées. |
| `Components/AJ_Tools_4D_Doc.4dbase` | Ancien composant binaire (`.4DB` + données). Utilisé nulle part dans le code (seulement cité dans deux commentaires « TODO »). |
| `Components/Cache`, `Logs/`, `Resources/Cache`, `Resources/Preferences`, `Project/DerivedData` | Fichiers générés, commités par le passé. |

Ces fichiers générés, `AJ_Tools_4D_Doc.4dbase` et les formulaires `zz_*` ne sont **pas** retirés par cette migration : ce sera une PR de nettoyage séparée. `Project/DerivedData` contient encore le code compilé 19 R7 commité à l'époque ; il n'a pas été mis à jour pour garder la PR lisible.

## API partagée

Méthodes `"shared":true` : `New AJUI_Tip`, `AJUI_Tip` (renvoie `cs.Tip`), `AJUI_Tip_info`, `AJUI_Tip_clearCache`, `AJUI_Tip_loadTemplates`. Les noms, attributs (`shared`, `invisible`) et comportements sont inchangés.

## Dépendances

- **4D SVG** : `SVG_New`, `SVG_New_path`, `SVG_PATH_LINE_TO`, `SVG_PATH_CURVE`, `SVG_PATH_ARC`, `SVG_SET_OPACITY`, `SVG_New_textArea`, `SVG_Define_filter`, `SVG_Filter_*`, `SVG_Export_to_picture`, etc. En 4D 21 R4, sans déclaration dans `dependencies.json`, ces appels ne compilent pas. Avec la déclaration, la compilation passe, et un hôte qui ne déclare qu'AJUI_Tip reçoit 4D SVG automatiquement (vérifié : 4D SVG 21.10 téléchargé depuis GitHub).
- **Plugins** : aucun.
- Pas de tables.

## Migration 4D 21 R4

Avec `compatibilityVersion` 2140, le premier essai de compilation donnait 1 539 erreurs et 209 avertissements : locales non déclarées, paramètres `$0`/`$1` hors prototype, directives `C_*` obsolètes. Avant cela, avec l'ancien fichier projet, la compilation passait avec 384 avertissements.

Ce qui a été fait :

1. **Jetons retirés.** Les suffixes `:C` (commandes), `:K` (constantes) ont été retirés du code (pas des chaînes ni des commentaires), comme dans AJUI_Animate.
2. **`var`.** Les directives `C_TEXT`, `C_LONGINT`, `C_REAL`, `C_OBJECT`, `C_BOOLEAN`, `C_COLLECTION`, `C_PICTURE`, `C_TIME` ([Variables](https://developer.4d.com/docs/21-R4/Concepts/variables)) sont remplacées par `var`. Les locales non déclarées sont typées avec **le type que le compilateur leur donnait déjà** (symboles du compilateur, option `generateSymbols` de `Compile project`) : par exemple une locale numérique non déclarée reste `Real`. Le code compilé garde donc les mêmes types.
3. **`#DECLARE`.** Dans les méthodes, `$1`, `$2`… deviennent `$param1`, `$param2`… et `$0` devient `$result` (ou `$return` quand `$result` existait déjà), déclarés par `#DECLARE(...) -> $result : Type` ([Paramètres](https://developer.4d.com/docs/21-R4/Concepts/parameters)). `Count parameters` compte toujours les paramètres réellement passés : les setters/getters appelés par `Formula` (sans paramètre = lecture, avec paramètre = écriture) gardent leur comportement.
4. **Classe `Tip`.** Paramètres déclarés dans les prototypes (`Function tipDuration($param1 : Real) -> $result : Real`, `Class constructor($param1 : Object)`). Propriétés déclarées ([Classes](https://developer.4d.com/docs/21-R4/Concepts/classes)) : `property animation; arrow; closeBox; container; debug; global; pu; subForm; target; text : Object` et `property failImport : Boolean`.
5. **Variable interprocess.** `var` ne déclare pas les variables interprocess (doc Variables). `C_OBJECT(<>AJUI_Tip_Storage)` est conservé dans `AJUI_Tip_init_attributes`, entouré de `//%W-551.2` / `//%W+551.2` ([désactivation locale d'un avertissement](https://developer.4d.com/docs/21-R4/Project/compiler)).
6. **Version.** `AJUI_Tip_info` : `"1.8.0"  // 22 Nov 2026 (4D 21 R4)`, retour `AJUI_Tip (v21 R4) : 1.8.0`. La fiche `Documentation/Methods/AJUI_Tip_info.md` est mise à jour.
7. **Construction.** `Settings/buildApp.4DSettings` ajouté (même modèle qu'AJUI_Animate). `AJUI_BuildComponent` cherchait `+Build` et `GMT` + CR dans `AJUI_Tip_info` pour incrémenter le numéro de build ; avec le nouveau format il aurait réécrit la méthode de travers. L'incrément n'est plus fait que si l'ancien format est présent ; `BUILD APPLICATION` reste appelé sur `Settings/buildApp.4DSettings`.

## Vérifications (Mac mini, 4D 21 R4 build 21R4.100185)

- `Compile project` (cibles `x86_64_generic` et `arm64_macOS_lib`) : **succès, 0 erreur, 0 avertissement**.
- `BUILD APPLICATION` : OK=1, `AJUI_Tip.4dbase` avec `AJUI_Tip.4DZ` et `Libraries/lib4d-arm64.dylib`, `codesign -v` valide.
- Projet hôte de test (composant compilé déclaré dans `dependencies.json`) : composants chargés `4D SVG` et `AJUI_Tip` ; `AJUI_Tip_info` = `AJUI_Tip (v21 R4) : 1.8.0` ; `New AJUI_Tip` crée l'instance ; `TipName`, `CornerRadius`, `TipPosition`, `TextLabel`, `TargetCoordinates` fonctionnent en écriture et en lecture.

## Risques et points non testés

1. **Affichage non testé.** Le test tourne sans interface (`--headless`) : `Show`, `Hide`, le dessin SVG, les animations et les workers n'ont pas été exécutés. La compilation garantit les types et les appels, pas le rendu.
2. **Formulaires `zz_*`** : convertis (jetons, `var`) mais non ouverts.
3. Dans `Class constructor`, le code d'origine teste `This.failImport`, qui n'est jamais renseigné (le résultat de l'import est dans `$template_obj.failImport`). Comportement d'origine conservé, à corriger éventuellement dans une PR dédiée.
4. `menus.json` référence `dial_AnotherTipLab` et `unit_EXECUTE_ALL`, qui n'existent pas dans le projet (déjà le cas avant la migration).
5. `AJ_Tools_4D_Doc.4dbase` (binaire) reste dans `Components/` jusqu'à la PR de nettoyage.
