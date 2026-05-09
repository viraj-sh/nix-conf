# NixOS Configuration

A modular, flake-based multi-host NixOS configuration.

## Overview

This repository manages multiple systems from a single `flake.nix`, including:

* **Desktop (NixOS)** – primary workstation (Niri-based, GNOME optional)
* **Laptop (NixOS)** – similar to desktop, minor variations pending
* **Server (NixOS)** – headless, service-oriented
* **macOS (nix-darwin)** – declarative system configuration

## Structure

* **hosts/** – host-specific configurations
* **nixos/** – system modules (boot, desktop, networking, virtualization, etc.)
* **home/** – Home Manager modules and user environment
* **dotfiles/** – application and UI configuration
* **compose/** – service definitions (converted to Nix via OCI/compose2nix)
* **scripts/** – utility scripts used across the system
* **secrets/** – managed sensitive configuration
* **automation/** – workflows and integrations (including n8n)

## Features

* Unified multi-host configuration via flakes
* Modular NixOS and Home Manager setup
* Declarative user environment and dotfiles
* Docker/OCI services managed through Nix
* Secrets integration for sensitive data
* Support for both Linux (NixOS) and macOS (nix-darwin)

## Status

* Desktop, server, and macOS configurations are stable
* Laptop configuration is pending final adjustments
* Modules and services are actively maintained and extended

## Notes

This is a personal configuration and continues to evolve.

