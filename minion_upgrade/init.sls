{% from "minion_upgrade/map.jinja" import saltver, salt_paths, salt_commands with context %}
{% set version = grains['saltversion'] %}
{% if version < saltver %}
  send salt installer:
    file.managed:
      - name: {{ salt_paths.dest_path }}
      - source: {{ salt_paths.source_path }}

  upgrade salt minion:
    cmd.run:
      - name: {{ salt_commands.install }}
      - bg: true
      - require:
        - file: send salt installer
{% else %}
  salt upgrade test:
    test.configurable_test_state:
      - name: version check
      - changes: False
      - result: True
      - comment: |
          salt version {{ saltver }} requested
          salt version {{ version }} is already installed
{% endif %}