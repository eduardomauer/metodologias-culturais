# Forgejo, Zenodo and Software Heritage Pipeline

## Canonical chain

1. Work internally.
2. Move public-safe files to the canonical forge.
3. Create an immutable tag.
4. Generate checksums and release notes.
5. Deposit the release package in Zenodo by deposition API.
6. Archive the release in Software Heritage and record the SWHID.
7. Update citation metadata with DOI, SWHID, origin, path and lines.

## Required outputs

- CITATION.cff
- codemeta.json
- .zenodo.json
- metadata/datacite.json
- metadata/dcat.json
- metadata/provenance.json
- metadata/checksums/MANIFEST_SHA256.txt

## Status

Pipeline specification only. No DOI, SWHID or final tag is valid until created and verified.
