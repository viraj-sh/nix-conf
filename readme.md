# NixOS Configuration (Work in Progress)

This repository contains the early structure of a modular NixOS configuration. It is currently in a preliminary state and far from complete. Many files are placeholders or empty, and several components are yet to be added or expanded.

## Overview

The repository is organized into several primary sections:

### NixOS System Configuration
- **flake.nix** provides the entry point for the flake-based setup.
- **nixos/** contains core, desktop, program, and service modules.  
  These modules are currently only structural and not fully populated.
- **hosts/** includes host-specific configurations for desktop, laptop, and server environments.
- **home/** contains Home Manager configurations for different machines.

### Dotfiles
The **dotfiles/** directory holds initial configurations for terminal emulators, window managers, notification systems, launchers, and editor profiles. These files are present but not yet integrated into a full declarative workflow.

### Compose (Docker Services)
The **compose/** directory includes many service folders, each containing:
- A `docker-compose.yaml` file
- An `INSTRUCTIONS.md` file  
Some services also include additional scripts or example files.

These compose definitions are functional on their own but not yet connected to NixOS modules or automated deployment.

## Current Status

- Most Nix files have not been written yet.
- The structure is in place, but configuration logic, modules, and integrations are still pending.
- Dotfiles are partially added; more will be included later.
- Compose service definitions are present but not yet tied into the NixOS configuration.
- The repository is less than 20% complete.

## Roadmap (Planned)

- Populate NixOS modules with functional configurations.
- Integrate Home Manager with the dotfiles provided.
- Link Docker Compose services into NixOS system or Home Manager modules.
- Add missing services, programs, and host-specific logic.
- Improve documentation as the project develops.

## Notes

This repository is under active development and not ready for use as a complete NixOS configuration. Further updates will progressively fill in the existing structure.

