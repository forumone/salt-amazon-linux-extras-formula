{% for app in salt['pillar.get']('amazon-linux-extras', {}) %}
/bin/amazon-linux-extras install -y {{ app }}:
  cmd.run:
    - unless: 
      - /bin/amazon-linux-extras list | grep {{ app }} | grep -c enabled
{% endfor %}
    
