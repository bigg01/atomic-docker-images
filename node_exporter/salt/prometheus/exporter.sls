prometheus-node-exporter:
{%- if grains['osfinger'] == 'Debian-8' %}
  pkg.installed:
    - fromrepo: jessie-backports
    - require:
      - pkgrepo: jessie-backports
{%- else %}
  pkg.installed:
    - pkgs:
      - prometheus-node-exporter
{%- endif %}
  service.running:
    - enable: True
    - watch:
      - file: /etc/default/prometheus-node-exporter

/etc/ferm.d/40-prometheus.conf:
  file.managed:
    - source: salt://prometheus/files/ferm.conf
    - user: root
    - group: root
    - mode: 644
    - require:
      - pkg: ferm

/etc/default/prometheus-node-exporter:
  file.managed:
    - source: salt://prometheus/files/prometheus-node-exporter
    - user: root
    - group: root
    - mode: 644
    - require:
       - pkg: prometheus-node-exporter
