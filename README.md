# Fiji

Fiji is a set of scripts that configures a fresh Fedora Workstation installation to my personal preferences.
It is not intended for general-purpose use, but you might find some of the configurations and applications useful.

This project started as a fork of [Omakub](https://github.com/basecamp/omakub) and as such has many scripts that are similar or equal to theirs.
Still, I have made some changes in Fiji that reflect my preferences.

## Usage

> [!WARNING]
> These scripts are designed for a **fresh Fedora Workstation 42+ installation**. Fiji is idempotent and can be executed on a running system, but the outcome is not entirely predictable.

To start the setup, run the following command in your terminal:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Bejdenn/fiji/main/boot.sh)"
```

## What's Included?

Fiji installs and configures a variety of applications and system settings, primarily for a development workflow.
