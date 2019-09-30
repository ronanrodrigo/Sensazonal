# Sensazonal

[![Bitrise](https://img.shields.io/bitrise/fba0d143cab8841c/master?label=Core&logo=Sensazonal%2FCore&style=flat&token=_9GD4444g3f1CK5V4Xz0AA)](https://app.bitrise.io/app/fba0d143cab8841c)
[![Bitrise](https://img.shields.io/bitrise/359a26b855f03c6d/master?label=Share&logo=Sensazonal%2FShare&style=flat&token=p6CyqDFzHHAY8ZikIhUVsg)](https://app.bitrise.io/app/359a26b855f03c6d)
[![Bitrise](https://img.shields.io/bitrise/971fbe33c509a0ee/master?label=iOS&logo=Sensazonal%2FiOS&style=flat&token=5xqzFjAkSQ8jcrUK99s2hA)](https://app.bitrise.io/app/971fbe33c509a0ee)
[![codebeat badge](https://codebeat.co/badges/ebde7674-9efe-4081-a066-1d2de4e5301a)](https://codebeat.co/projects/github-com-ronanrodrigo-sensazonal-master)

## Requiremetnts
- Xcode 11.10+
- Homebrew
- Carthage
- SwiftLint

## Setup Enviroment
- Clone the repository:
`git clone git@gitlab.com:ronanrodrigo/Sensazonal.git`
- Access the project folder and run setup script:
`./Support/setup `

## Organization
- Core: A cross-platform package, contains protocol definitions and business rules implementation. Not allowed external dependencies here, all code here should run fast and without influence from third party libraries;
- Share: Also a cross-platform package, but implementing some protocols defined at Core (mostly Gateways). Allowed external dependencies here;
- iOS: Platform-specific code, implementing some protocols from Core (mostly Presenters) and using Share and Core to execute the use cases. In the future, there will be versions for macOS, tvOS, shell, web and others.
