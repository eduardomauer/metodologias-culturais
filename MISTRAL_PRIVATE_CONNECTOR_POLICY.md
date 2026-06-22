# Mistral Private Connector Policy

The Creative Systems Mistral Kernel is treated as a private automation component, not as a public Atlas data source.

## Public repository rule

Public repositories may document connector architecture, endpoints and safety boundaries, but must not include:

- real API keys;
- local .env files;
- private logs;
- private prompts;
- execution traces;
- user conversations;
- secret tokens;
- personal data.

## Operational rule

Mistral keys must live only in server secrets, Forgejo secrets, local .env files outside Git or another approved secret manager.

## Boundary

The kernel is not applied directly to public Atlas data without RGPD, rights, human review and publication gates.
