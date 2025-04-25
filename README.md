# Path of Exile 2 Lazy Filter Installer

A simple, one-click solution to download NeverSink's filter presets for Path of Exile 2.

## Features

- **Single File**: Just one batch file, no dependencies or external files needed
- **Automatic Detection**: Finds or creates your Path of Exile 2 filter directory
- **Easy Configuration**: Simple setting to control whether the filter folder opens automatically
- **All Presets**: Downloads all NeverSink's filter presets (SOFT to UBER-PLUS-STRICT)
- **No Installation**: Just download and run, no setup required

## How to Use

1. Download `PoE2Filters.bat` from this repository
2. Double-click to run
3. All filter presets will be downloaded to your Path of Exile 2 filters directory

## Configuration

Open `PoE2Filters.bat` in any text editor to change settings:

```batch
:: Configuration - Set to TRUE to automatically open the filter directory when done
set "OPEN_FILTER_DIR=FALSE"
```

Change `FALSE` to `TRUE` if you want the filter directory to open automatically when the script finishes.

## Filter Presets

The following filter presets are downloaded:

- **SOFT**: Shows almost all items. Great for new leagues and new players.
- **REGULAR**: Balanced filter for regular gameplay.
- **SEMI-STRICT**: Hides low value items. Recommended for most players.
- **STRICT**: Hides more items. Good for efficient farming.
- **VERY-STRICT**: Hides most items. For fast mapping and experienced players.
- **UBER-STRICT**: Shows only valuable items. For very efficient farming.
- **UBER-PLUS-STRICT**: Shows only the most valuable items. For extremely efficient farming.

## Credits

- [NeverSink](https://github.com/NeverSinkDev) for creating and maintaining the excellent Path of Exile 2 filters
- [FilterBlade](https://www.filterblade.xyz/) for the filter customization platform

## License

This project is licensed under the MIT License - see the LICENSE file for details.
