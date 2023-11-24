# NVD Library Mod for Flowpipe

A collection of [Flowpipe](https://flowpipe.io) pipelines that can be used to:

- List CVEs
- Get CVE
- Search CVEs
- And more!

![image](https://github.com/turbot/flowpipe-mod-nvd/blob/update-docs/docs/images/flowpipe_test_run.png?raw=true)

## Documentation

- **[Pipelines →](https://hub.flowpipe.io/mods/turbot/nvd/pipelines)**
- **[Triggers →](https://hub.flowpipe.io/mods/turbot/nvd/triggers)**

## Getting started

### Installation

Download and install Flowpipe (https://flowpipe.io/downloads). Or use Brew:

```sh
brew tap turbot/tap
brew install flowpipe
```

Clone:

```sh
git clone https://github.com/turbot/flowpipe-mod-nvd.git
cd flowpipe-mod-nvd
```

### Configuration

This does not require credentials.

### Usage

Start the Flowpipe server to get started:

```sh
flowpipe service start
```

Run a pipeline:

```sh
flowpipe pipeline run list_cves
```

## Passing pipeline arguments

To pass values into pipeline [parameters](https://flowpipe.io/docs/using-flowpipe/pipeline-parameters), use the following syntax:

```sh
flowpipe pipeline run list_cves
```

Multiple pipeline args can be passed in with separate `--arg` flags.

For more information on passing arguments, please see [Pipeline Args](https://flowpipe.io/docs/using-flowpipe/pipeline-arguments).

## Contributing

If you have an idea for additional controls or just want to help maintain and extend this mod ([or others](https://github.com/topics/flowpipe-mod)) we would love you to join the community and start contributing.

- **[Join #flowpipe in our Slack community ](https://flowpipe.io/community/join)**

Please see the [contribution guidelines](https://github.com/turbot/flowpipe/blob/main/CONTRIBUTING.md) and our [code of conduct](https://github.com/turbot/flowpipe/blob/main/CODE_OF_CONDUCT.md).

Want to help but not sure where to start? Pick up one of the `help wanted` issues:

- [Flowpipe](https://github.com/turbot/flowpipe/labels/help%20wanted)
- [NVD Mod](https://github.com/turbot/flowpipe-mod-nvd/labels/help%20wanted)

## License

This mod is licensed under the [Apache License 2.0](https://github.com/turbot/flowpipe-mod-nvd/blob/main/LICENSE).

Flowpipe is licensed under the [AGPLv3](https://github.com/turbot/flowpipe/blob/main/LICENSE).
