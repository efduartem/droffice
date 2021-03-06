<#import "/spring.ftl" as spring />
<#include "/main.ftl"/>
<!DOCTYPE html>
<html>
<head>
    <@html_head/>
    <link type="text/css" rel="stylesheet" href="<@spring.url '/css/main.css'/>"/>
    <link type="text/css" rel="stylesheet" href="<@spring.url '/css/patients/index.css'/>"/>
    <title><@spring.message code='patients'/></title>
    <script>
        var patientAutocompleteJSON = ${patientAutocompleteJSON};
    </script>
</head>
<header>
    <@header_nav/>
</header>
<body>
    <div class="row">
        <div class="col s12 m12 l12">
            <!-- Este div no tiene contenido, ya que la clase row aplica a su primer hijo
          pone por defecto un estilo centrado,entonces este sirve para que al resto de los hijos
        no queden asignados con dicho estilo-->
        </div>
        <div class="col s2 offset-s1 m2 offset-m1 l2 offset-l1 div-button">
            <form id="addPattientForm" action="/patients/create" method="get">
                <a id="addPatientButton" class="waves-effect waves-light btn blue darken-4">
                    <i class="material-icons left">add</i><@spring.message code='add.patient'/>
                </a>
            </form>
        </div>
        <div class="col s7 m7 l7 div-search">
            <form id="searchForm" action="/patients/index" method="get">
                <div class="input-field">
                    <input id="search" name="search" placeholder="<@spring.message code='insert.search'/>" class="search-input autocomplete" type="search" autocomplete="off" value="${parameterSearch}">
                    <label class="label-icon" for="search"><i class="material-icons">search</i></label>
                    <i class="material-icons">close</i>
                </div>
            </form>
        </div>
        <div class="col offset-s1 s10 offset-m1 m10 offset-l1 l10">
            <table class="striped highlight">
                <thead>
                <tr>
                    <th><@spring.message code='patient.name'/></th>
                    <th><@spring.message code='patient.address'/></th>
                    <th><@spring.message code='patient.birthday'/></th>
                    <th><@spring.message code='patient.sex'/></th>
                </tr>
                </thead>
                <tbody>
                <#list patientsList  as patient>
                    <tr class="clickable" id="${patient.id}">
                        <a class="hide" href="<@spring.url '/patients/show/${patient.id}'/>"></a>
                        <td>${patient.name}</td>
                        <td>${patient.address}</td>
                        <td>${patient.birthdayString}</td>
                        <td><@spring.message code='patient.sex.${patient.sex}'/></td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    </div>
    <@script_javascript/>
    <script type="text/javascript" src="<@spring.url '/js/jquery.validate.min.js'/>"></script>
    <script type="text/javascript" src="<@spring.url '/js/patients/index.js'/>"></script>
</body>
</html>