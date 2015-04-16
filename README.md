# nrpe

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with nrpe](#setup)
    * [What nrpe affects](#what-nrpe-affects)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module installs and manages the NRPE server.

## Module Description

This module differs from most existing NRPE module on the following points:

* commands are defined through a simple hash, not through resources;
* plugins are not managed;
* nagios/shinken/any monitoring system is not managed.

## Setup

### What nrpe affects

* nrpe package and service
* `/etc/nagios/nrpe.cfg`

## Usage

This module can be included, required, contained, or defined.
However, to be useful, you should define it, as that allows you to specify extra/custom commands and set the allowed hosts.

## Reference

*todo*

## Limitations

The module has been tested/used in production with Puppet 3.x.

On the OS side, the module currently only works on Debian-family OSes, but we'd love to get a patch to add support for more families/operating systems.

## Development

Development is happening on [github](https://github.com/OpenConceptConsulting/puppet-nrpe), and we welcome pull requests!

