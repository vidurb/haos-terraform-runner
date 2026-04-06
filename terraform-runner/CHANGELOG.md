# Changelog

## 0.3.2 - 2026-04-07

- Fix: keep `curl` installed at runtime (required by bashio for Supervisor API calls).

## 0.3.1 - 2026-04-07

- Fix: publish images to `ghcr.io/vidurb/haos-terraform-runner/terraform-runner` to match addon config.

## 0.3.0 - 2026-04-07

- Build images in GitHub Actions CI and push to GHCR; no more on-device builds.
- Pin tfc-agent to v1.28.6 and download release zip instead of multi-stage Docker copy.
- Remove deprecated `build.yaml` in favor of multi-platform base image.

## 0.2.1 - 2026-04-07

- Fix: copy all tfc-agent companion binaries (tfc-agent-core, etc.), not just the main binary.

## 0.2.0 - 2026-04-06

- Add aarch64 (ARM64) support for Raspberry Pi and other ARM boards.

## 0.1.0 - 2026-04-06

- Initial release: HCP Terraform self-hosted agent (`tfc-agent`) for Home Assistant OS (amd64).
