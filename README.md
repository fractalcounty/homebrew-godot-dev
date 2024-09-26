# Godot development builds for Homebrew

[![Update Godot Casks](https://github.com/fractalcounty/homebrew-godot-dev/actions/workflows/update-cask.yml/badge.svg)](https://github.com/fractalcounty/homebrew-godot-dev/actions/workflows/update-cask.yml)
[![Latest Godot Dev Version](https://img.shields.io/github/v/tag/godotengine/godot-builds?label=version&include_prereleases&sort=semver)](https://github.com/godotengine/godot-builds/releases)
[![License](https://img.shields.io/github/license/fractalcounty/homebrew-godot-dev)](LICENSE)

This is a [Homebrew](https://brew.sh/) tap that allows you to install the latest development preview builds of the [Godot Engine](https://godotengine.org/) on macOS using [Homebrew Cask](https://github.com/Homebrew/homebrew-cask). This tap provides access to development previews (e.g., `4.4-dev2`, `4.3-rc2`) that are not available in the official Homebrew cask, which only covers stable releases (e.g., `4.3`).

The cask is automatically updated using a GitHub Actions workflow to always point to the latest development build available from the [Godot Engine's official builds](https://github.com/godotengine/godot-builds/releases).

## Installation

1. Add this tap to your Homebrew installation:

    ```zsh
    brew tap fractalcounty/homebrew-godot-dev
    ```

2. Install the Godot development build:

    ```zsh
    brew install --cask godot-dev
    ```

## Updating

To update the Godot development build to the latest version, run:

```zsh
brew update
brew upgrade --cask godot-dev
```

## Caveats

- **Development Version**: This cask installs a development version of Godot Engine, which may be unstable or contain bugs. Use at your own risk.
- **Stable Releases**: For stable releases of Godot Engine, use the official Homebrew cask:

    ```zsh
    brew install --cask godot
    ```

## Contributing

Contributions are welcome! Please open an [issue](https://github.com/fractalcounty/homebrew-godot-dev/issues) or submit a [pull request](https://github.com/fractalcounty/homebrew-godot-dev/pulls) if you have any suggestions or improvements.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
