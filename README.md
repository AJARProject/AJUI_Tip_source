# AJUI Tip

Composant 4D d'AJAR SA qui affiche des bulles d'aide (« tips ») dessinées en SVG à côté d'un objet de formulaire : position, flèche, couleurs, police, bouton de fermeture, animations (clignotement, saut, fondu), modèles JSON.

Sources du composant [AJUI_Tip](https://github.com/AJARProject/AJUI_Tip). La documentation d'origine reste sur le [wiki](https://github.com/AJARProject/AJUI_Tip/wiki) et dans `Documentation/Methods`. Ce dépôt n'est pas maintenu activement ; une proposition de correction peut passer par une [pull request](https://github.com/AJARProject/AJUI_Tip_source/pulls).

**4D 21 R4**, mode projet, `compatibilityVersion` 2140. Version **1.8.0** : `AJUI_Tip_info` renvoie `AJUI_Tip (v21 R4) : 1.8.0`. Licence MIT (`license`).

Cette nouvelle version a été réalisée avec l'aide de Cursor et de Grok Bot. Analyse du dépôt et détail de la migration : [ANALYSIS.md](ANALYSIS.md).

## Installation rapide

**Interprété.** Ouvrir `Project/AJUI_Tip.4DProject` avec 4D 21 R4, ou déclarer le dossier du dépôt comme dépendance locale d'un hôte (`"AJUI_Tip": {}` dans `dependencies.json`, chemin dans `environment4d.json`). Une dépendance vers les sources ne fonctionne qu'en interprété.

**Compilé.** Construire le composant (Développement > Générer l'application, ou `AJUI_Tip_buildComponent`, qui appelle `BUILD APPLICATION` sur `Settings/buildApp.4DSettings`). Le `.4dbase` produit (avec `AJUI_Tip.4DZ`, compilé pour Intel et Apple Silicon, signé) se place dans le dossier `Components` de l'hôte, ou se déclare dans `dependencies.json`. Un hôte compilé ne charge pas un composant interprété.

**4D SVG** est déclaré dans `Project/Sources/dependencies.json` (`github: 4d/4D-SVG`). Sans cette déclaration, les appels `SVG_*` ne compilent pas en 4D 21 R4. Le gestionnaire de dépendances de 4D l'installe aussi chez l'hôte.

## Utilisation

```4d
var $tip : Object
$tip:=New AJUI_Tip
$tip.TargetName("info")
$tip.TipName("tipInfo")
$tip.TipPosition("top")
$tip.TextLabel("Bonjour")
$tip.Show()
```

Les fiches de chaque méthode partagée sont dans `Documentation/Methods`.

## Changements de la migration 4D 21 R4 (1.8.0)

- `Project/AJUI_Tip.4DProject` : `compatibilityVersion` 2140, `tokenizedText` false ; les jetons `:C` / `:K` ont été retirés du code.
- Directives `C_TEXT`, `C_LONGINT`… remplacées par `var` ; `$0` / `$1`… remplacés par `#DECLARE(...) -> $result` (méthodes) ou par le prototype de la fonction (classe `Tip`). Les types sont ceux que le compilateur déduisait déjà. Aucun changement de logique.
- Classe `Tip` : propriétés déclarées avec `property`.
- `<>AJUI_Tip_Storage` est une variable interprocess : `var` ne peut pas la déclarer, la directive `C_OBJECT` est donc conservée et son avertissement (551.2) est désactivé localement.
- `Settings/buildApp.4DSettings` ajouté (composant, cibles Intel + Apple Silicon) ; `AJUI_BuildComponent` ne tente plus d'incrémenter « +Build » quand la version n'a plus ce format.
- Résultat : compilation 4D 21 R4 sans erreur ni avertissement.

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.

---

# AJUI Tip

4D component by AJAR SA that shows SVG-drawn help bubbles ("tips") next to a form object: position, arrow, colors, font, close box, animations (blink, jump, fade), JSON templates.

Sources of the [AJUI_Tip](https://github.com/AJARProject/AJUI_Tip) component. The original documentation is on the [wiki](https://github.com/AJARProject/AJUI_Tip/wiki) and in `Documentation/Methods`. This repository is not actively maintained; fixes can be proposed with a [pull request](https://github.com/AJARProject/AJUI_Tip_source/pulls).

**4D 21 R4**, project mode, `compatibilityVersion` 2140. Version **1.8.0**: `AJUI_Tip_info` returns `AJUI_Tip (v21 R4) : 1.8.0`. MIT licence (`license`).

This new version was built with the help of Cursor and Grok Bot. Analysis of the repository and migration details (in French): [ANALYSIS.md](ANALYSIS.md).

## Short install

**Interpreted.** Open `Project/AJUI_Tip.4DProject` with 4D 21 R4, or declare the repository folder as a local host dependency (`"AJUI_Tip": {}` in `dependencies.json`, path in `environment4d.json`). A dependency on sources works in interpreted mode only.

**Compiled.** Build the component (Design > Build Application, or `AJUI_Tip_buildComponent`, which calls `BUILD APPLICATION` on `Settings/buildApp.4DSettings`). Put the resulting `.4dbase` (with `AJUI_Tip.4DZ`, compiled for Intel and Apple Silicon, signed) in the host `Components` folder, or declare it in `dependencies.json`. A compiled host does not load an interpreted component.

**4D SVG** is declared in `Project/Sources/dependencies.json` (`github: 4d/4D-SVG`). Without it, the `SVG_*` calls do not compile in 4D 21 R4. 4D's dependency manager also installs it in the host.

## Usage

```4d
var $tip : Object
$tip:=New AJUI_Tip
$tip.TargetName("info")
$tip.TipName("tipInfo")
$tip.TipPosition("top")
$tip.TextLabel("Hello")
$tip.Show()
```

Each shared method is documented in `Documentation/Methods`.

## 4D 21 R4 migration changes (1.8.0)

- `Project/AJUI_Tip.4DProject`: `compatibilityVersion` 2140, `tokenizedText` false; the `:C` / `:K` tokens were removed from the code.
- `C_TEXT`, `C_LONGINT`… directives replaced with `var`; `$0` / `$1`… replaced with `#DECLARE(...) -> $result` (methods) or with the function prototype (`Tip` class). Types are the ones the compiler already inferred. No logic change.
- `Tip` class: properties declared with `property`.
- `<>AJUI_Tip_Storage` is an interprocess variable: `var` cannot declare it, so the `C_OBJECT` directive is kept and its warning (551.2) is disabled locally.
- `Settings/buildApp.4DSettings` added (component, Intel + Apple Silicon targets); `AJUI_BuildComponent` no longer tries to increment "+Build" when the version no longer has that format.
- Result: 4D 21 R4 compilation with no error and no warning.

Made with Cursor / Grok Bot (Codesky) for Maurice Inzirillo.
