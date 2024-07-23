{% macro concat_route(origin, destination) %}
    {{ origin }} || ' to ' || {{ destination }}
{% endmacro %}
