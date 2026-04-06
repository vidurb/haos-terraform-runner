# haos-terraform-runner

Home Assistant OS add-on repository that runs an [HCP Terraform](https://developer.hashicorp.com/terraform/cloud-docs/agents) self-hosted agent (`tfc-agent`) on your Home Assistant machine.

## Install

1. In Home Assistant: **Settings** → **Add-ons** → **Add-on Store** → **⋮** → **Repositories**
2. Add: `https://github.com/vidurb/haos-terraform-runner`
3. Refresh the store, open **HAOS Terraform Runner**, install, set your **agent pool token**, then start.

## Layout

- [`terraform-runner/`](terraform-runner/) — Supervisor add-on (metadata, image build, entrypoint)

## Requirements

- **amd64** Home Assistant installation (the upstream agent image is amd64-only).
- An agent pool and token from HCP Terraform / Terraform Cloud.

## Documentation

See the add-on **Documentation** tab in Home Assistant or [`terraform-runner/DOCS.md`](terraform-runner/DOCS.md).

## License

MIT
