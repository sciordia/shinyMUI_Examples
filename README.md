---

# shinyMUI: Material UI Components for Shiny

shinyMUI is an R package that provides Material UI components for use within Shiny applications. This package allows you to create more engaging and visually appealing user interfaces by leveraging the Material Design system.

## Installation

You can install the `shinyMUI` package directly from GitHub. To do so, you'll need the `devtools` package:

```R
install.packages("devtools")
```

Install `shinyMUI` from GitHub:

```R
devtools::install_github("sciordia/shinyMUI")
```

## Usage

Include `shinyMUI` in your server and UI code:

```R
library(shiny)
library(shinyMUI)
```

## Building and Running Locally

### R Package

To build and install the package locally:

1. Clone the repository:
   ```bash
   git clone git@github.com:sciordia/shinyMUI_Examples.git
   cd shinyMUI_Examples
   ```

2. Build the package using R commands:
   ```bash
   R CMD build shinyMUI
   R CMD INSTALL shinyMUI_0.1.0.tar.gz
   ```

*Note: Adjust the version number `0.1.0` as appropriate for your package.*

### JavaScript

If your package includes custom JavaScript components, you'll likely have a `/js` directory with the source files. To build these, you might be using `yarn`.

1. Navigate to the `/js` directory:
   ```bash
   cd js
   ```

2. Install JavaScript dependencies:
   ```bash
   yarn install
   ```

3. Run the build script defined in `package.json`:
   ```bash
   yarn build
   ```

*Note: The actual command may vary depending on how you've set up your JavaScript build process.*

### Running Examples Locally

To run the examples included in the package:

1. Navigate to the `/inst/examples` directory.
2. Run an example with `shiny::runApp()`:
   ```R
   shiny::runApp("example_app")
   ```

## Example

To see `shinyMUI` in action, check the `inst/examples` directory for Shiny apps using `shinyMUI` components.

## Contributions

Feel free to report issues, suggest enhancements, or contribute code:

1. **Report Issues:** Use the GitHub issues tracker to send bug reports or feature requests.
2. **Suggest Enhancements:** Feedback is always welcome. Please provide detailed information.
3. **Send Pull Requests:** If you've fixed a bug or added a feature, send a PR!

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on contributing.

## License

`shinyMUI` is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---
