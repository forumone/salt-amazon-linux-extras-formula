{% set pget = salt['pillar.get'] %}
{% for app in pget('amazon-linux-extras', {}) %}
/bin/amazon-linux-extras install {{ app }}:
  cmd.run:
    - unless: 
      - /bin/amazon-linux-extras list | grep {{ app }} | grep -c enabled
    