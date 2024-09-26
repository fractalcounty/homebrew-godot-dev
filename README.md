<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="https://github.com/user-attachments/assets/1f4f99e6-4a5b-4a36-b6d1-1e68a2aec7ba">
    <img alt="Dark and light mode variations of the homebrew-godot-dev logo" src="https://github.com/user-attachments/assets/a11140e8-b982-4535-ae01-4a801cba373b" width="500">
  </picture>
</div>

# Godot development snapshots for Homebrew
[![Update Godot Casks](https://github.com/fractalcounty/homebrew-godot-dev/actions/workflows/update-cask.yml/badge.svg)](https://github.com/fractalcounty/homebrew-godot-dev/actions/workflows/update-cask.yml)
[![Latest Godot Dev Version](https://img.shields.io/github/v/tag/godotengine/godot-builds?label=version&include_prereleases&sort=semver)](https://github.com/godotengine/godot-builds/releases)
[![License](https://img.shields.io/github/license/fractalcounty/homebrew-godot-dev)](LICENSE)

This is a Homebrew tap I made so that I could install the latest development preview builds of the [Godot Engine](https://godotengine.org/) on macOS using the Homebrew package manager. It provides the five most recent dev previews (e.g., `4.4-dev2`, `4.3-rc2`), as opposed to the [official Homebrew cask](https://formulae.brew.sh/cask/godot) which only covers the most recent stable release.

The cask is automatically updated using a GitHub Actions workflow to always point to the latest development build available from the [Godot Engine's official builds](https://github.com/godotengine/godot-builds/releases).

## Installation

> [!WARNING]
> This is an unofficial project created for my own convienence and isn't maintained by the Godot team. Use at your own risk!

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
