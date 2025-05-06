# Mars Rover - Swift Implementation

This is the Swift implementation of the Mars Rover kata using Swift Package Manager and XCTest framework.

## Requirements

- Swift 5.5 or later
- Xcode (if running on macOS)

## Setup

### macOS

1. Install Xcode from the App Store
2. Install Command Line Tools:
   ```bash
   xcode-select --install
   ```
3. Select Xcode as the active developer directory:
   ```bash
   sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
   ```

### Troubleshooting

If you encounter toolchain errors when running tests:

1. Verify Swift installation:
   ```bash
   swift --version
   ```

2. Make sure Xcode Command Line Tools are properly set up:
   ```bash
   xcode-select -p
   ```
   It should point to `/Applications/Xcode.app/Contents/Developer`

3. If issues persist, try resetting the package:
   ```bash
   rm -rf .build
   swift package clean
   swift build
   ```

## Running Tests

To run the tests from the command line:

```bash
swift test
```

Or open the package in Xcode and run the tests from there.

## Project Structure

- `Sources/MarsRover/Rover.swift`: Contains the main implementation of the Rover class
- `Tests/MarsRoverTests/RoverTests.swift`: Contains the test suite
- `Package.swift`: Swift Package Manager configuration file
