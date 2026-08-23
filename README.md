# Rebuilty OS

> **Rebuilty OS is a community rebranded/customized operating system based on the open-source ReactOS project. It is not Microsoft Windows.**

## What is Rebuilty OS?

Rebuilty OS is an experimental Windows-compatible operating system project built around **ReactOS** and its open-source implementation of Windows-compatible/NT functionality.

The project may add its own branding, configuration, installer options, tools, and compatibility components on top of ReactOS.

### Important clarification

- 🪟 **Rebuilty OS is NOT Microsoft Windows.**
- 🔓 **Rebuilty uses open-source ReactOS code**, subject to the licenses of the components used.
- 🧩 **Rebuilty may use Windows-compatible APIs**, but it does **not** contain all Windows APIs and does not claim complete Windows compatibility.
- 🚫 **Microsoft's proprietary Windows source code and proprietary Windows binaries are not used as the basis of Rebuilty OS.**
- 🎨 The Rebuilty branding and custom work are separate from Microsoft's Windows branding.

## ReactOS relationship

ReactOS is the primary upstream project that Rebuilty OS is based on. Rebuilty is intended to remain clear about this relationship rather than presenting ReactOS-derived work as an entirely independent implementation.

ReactOS source is incorporated according to its applicable open-source licenses. See `LICENSE-REACTOS-NOTICE.md` and the ReactOS source tree for licensing and attribution information.

## Windows API compatibility

Rebuilty's compatibility goal is **Windows-compatible behavior**, not copying Microsoft's implementation.

The compatibility layer is expected to grow over time. Some Windows/Win32-style APIs may be available through ReactOS, while others may be incomplete, unsupported, or implemented differently.

## Optional x64 compatibility

Rebuilty can be designed with an **optional x64 compatibility component** selected during installation when the target ISO/build supports it.

The planned installer model is:

```text
Rebuilty OS Setup
├── Standard compatibility (default)
└── Enable x64 compatibility [Optional]
```

Selecting the x64 option should install/enable only the x64-compatible components supported by that build. It is **not a copy of Microsoft's x64 Windows APIs**. The implementation must come from ReactOS-compatible/open-source code or Rebuilty's own clean implementation, with each component's license respected.

> **Status:** The x64 installer option is currently a planned build feature. It should not be advertised as complete x64 Windows compatibility until the corresponding components are actually implemented and tested.

## Building

The repository contains scripts for obtaining ReactOS source and starting a Rebuilty build. The resulting ISO is intended to be a customized Rebuilty OS build rather than a Microsoft Windows image.

## Project goals

- ReactOS-based Windows compatibility
- Clear open-source provenance
- Rebuilty-specific branding and customization
- Optional architecture/compatibility components
- Eventually produce a bootable Rebuilty OS ISO for VM testing

## Legal / licensing note

This project is not affiliated with or endorsed by Microsoft.

ReactOS and its contributors retain their respective copyrights. ReactOS-derived portions remain subject to their applicable licenses. Rebuilty-specific code and assets may have separate licensing terms where permitted.

Before redistributing an ISO, verify the licenses and attribution requirements of **every included component**, including ReactOS-derived code and third-party dependencies.
