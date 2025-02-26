# ldes-benchmark

This repository holds the configurations and scripts to run the LDES benchmarks, which are used to evaluate the performance of different LDES fragmentations.

## Installation

```bash
npm install
```

## Data

The data used in the benchmarks is generated using the data RDF-Connect pipelines defined in the `data/pipelines` directory.
The data is gathered from the Telraam LDES, which is a real-world LDES that contains data from traffic sensors.

Instead of manually generating the different datasets, you can also download a zip containing all the data from [this Nextcloud link](https://cloud.ilabt.imec.be/index.php/s/LYDMFHXrTW3MeQb).

## Run

```bash
# Run as many client runners as you want, optionally on different machines.
npx ldes-evaluation-runner-client <name> <server-hostname>

# Run the benchmark orchestrator, this will start the benchmark and use the client runners.
npx ldes-evaluation-runner-orchestrator <env-file> <output-file> <hostname>
```

Alternatively, you can run the `run-benchmark-(2|6|10).sh` scripts instead of the orchestrator.
This will start the benchmark and use the client runners for each configuration in the `configs` directory.

```bash
npx ldes-evaluation-runner-client <name> <server-hostname>
SERVER_HOSTNAME=<hostname> ./run-benchmark-(2|6|10).sh
```
