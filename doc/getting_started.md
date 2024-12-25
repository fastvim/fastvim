# Getting started

Welcome to Fastvim, the next-gen Neovim distro that’s fast, modern, and totally configurable. Built for lazy folks who don’t want to mess with endless configs, and for the Neovim Martian 👽 hackers who want total control over their setup. Whether you just want things to work out of the box or you love tweaking every little detail, Fastvim’s got your back.

Forget about spending hours setting up your Neovim environment. With Fastvim, you can get started right away, but if you're into customization, it's as flexible as you need it to be. This distro has everything you need for a smooth, efficient workflow, and if you're feeling adventurous, you can dive in and make it your own.

Get ready to experience a Neovim setup that just works, without all the fluff. Let’s get you set up, quick and easy!

## Installation 

Installation is very simple, we support multiple platforms and have an installation script for both unix-based and Windows-based operating systems. 

So you've arrived at a good time, start by typing this command if you use unix-based operating systems:

```bash
bash <(curl -s https://raw.githubusercontent.com/fastvim/fastvim/main/install.sh)
```
Now on Windows

- powershell

```ps1
iex (iwr -UseBasicParsing https://raw.githubusercontent.com/fastvim/fastvim/main/install.ps1)
```

- cmd

```
powershell -Command "iex (iwr -UseBasicParsing https://raw.githubusercontent.com/fastvim/fastvim/main/install.ps1)"
```
Ready? Phew, now we can open neovim and let the lazy.nvim plugin manager do all the work of installing plugins for us.
