# HAOS Terraform Runner

This add-on runs the official HashiCorp [`tfc-agent`](https://developer.hashicorp.com/terraform/cloud-docs/agents) so your **HCP Terraform** / **Terraform Cloud** organization can execute plans and applies on your Home Assistant host (for example, to reach private networks or hardware only available at home).

## Prerequisites

- Home Assistant OS or Supervised installation on **amd64** (`x86_64`). The upstream agent image is **linux/amd64 only**; it will not run on ARM boards.
- An **agent pool** in your HCP Terraform / Terraform Cloud organization.
- An **agent token** created for that pool ([documentation](https://developer.hashicorp.com/terraform/cloud-docs/agents/agent-pools)).

## Installation

1. Open **Settings** → **Add-ons** → **Add-on Store**.
2. Open the **⋮** menu → **Repositories**.
3. Add: `https://github.com/vidurb/haos-terraform-runner`
4. Refresh the store, find **HAOS Terraform Runner**, and **Install**.

## Configuration

| Option           | Description |
|------------------|-------------|
| Agent pool token | Required. Paste the token from your agent pool (stored as a secret in the UI). |
| Agent name       | Optional. Shown in the Terraform Cloud agents UI; a default is used if empty. |
| Log level        | `trace`, `debug`, `info`, `warn`, or `error`. |
| Single-execution | If enabled, the agent handles **one** job then exits (useful for ephemeral workers; usually leave off for a home server). |
| API address      | Defaults to `https://app.terraform.io`. Use a custom hostname for Terraform Enterprise. |

Assign your workspaces to the same **agent pool** as this token so runs are dispatched to this agent.

## Data / cache

Agent data and cache are stored under `/data` in the add-on container (persisted by the Supervisor).

## Security

- Treat the agent token like a credential: anyone with it can join runs for that pool.
- Prefer **manual** start until the token is set; the add-on is configured with **manual** boot by default.

## Support

Issues: [haos-terraform-runner](https://github.com/vidurb/haos-terraform-runner/issues)
