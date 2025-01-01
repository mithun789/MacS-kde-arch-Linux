# Important Notice:

## This repository is intended for testing purposes only. Do not use it for any production or critical tasks. I highly recommend running the scripts in a virtual machine to avoid any potential risks to your primary environment.

## I will not be responsible for any damages or issues that arise from using this repository. By using the scripts, you acknowledge that you assume all risks associated with their use.

# MacSonoma KDE Theme

A sleek and modern KDE Plasma 6 theme inspired by macOS Sonoma, featuring glassy blur effects and a seamless user experience, optimized for Arch Linux.

![Theme Preview](preview.png)

## Features

- 🌟 Glassy blur effects for all windows
- 🎨 macOS Sonoma-inspired design
- 🚀 Launchpad-style application launcher
- 🎯 Custom application menu bar
- ⚙️ Modern Plasma 6 integration

## Prerequisites

- Arch Linux
- KDE Plasma 6
- Qt 6
- KWin

## Installation

### Dependencies

The installation script will automatically install the following packages:
- plasma
- qt6-base
- qt6-declarative
- kwin
- breeze

### Automatic Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/mithun789/MacSonoma-kde.git
   ```

2. Make the installation script executable:
   ```bash
   chmod +x install.sh
   ```

3. Run the installation script:
   ```bash
   ./install.sh
   ```

4. Log out and log back in to apply all changes.

## Customization

You can customize various aspects of the theme through System Settings:

1. Open System Settings
2. Navigate to Workspace Behavior → Desktop Effects
3. Adjust blur strength and other effects as desired

### Additional KDE Plasma 6 Tweaks

For the best experience, consider these additional tweaks:

1. Enable blur effects:
   ```bash
   kwriteconfig6 --file kwinrc --group Compositing --key EnableBlur true
   ```

2. Optimize animations:
   ```bash
   kwriteconfig6 --file kdeglobals --group KDE --key AnimationDurationFactor 0.5
   ```

## Troubleshooting

### Common Issues

1. If blur effects aren't working:
   ```bash
   kwin_x11 --replace &
   ```

2. If the theme isn't appearing in System Settings:
   ```bash
   kbuildsycoca6 --noincremental
   ```

## Contributing

Contributions are welcome! Please read our [Contributing Guidelines](CONTRIBUTING.md) before submitting pull requests.

## License

This project is licensed under the GPL-3.0 License - see the [LICENSE](LICENSE) file for details.

## Support

If you encounter any issues or have questions, please:

1. Check the [FAQ](docs/FAQ.md)
2. Search existing [Issues](https://github.com/mithun789/MacSonoma-kde/issues)
3. Create a new issue if needed

---

Made with ❤️ for the Arch Linux & KDE Plasma 6 Community
