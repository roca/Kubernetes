[#-- @ftlvariable name="action" type="com.atlassian.bamboo.deployments.projects.actions.ConfigureDeploymentProjectVersioning" --]
[#-- @ftlvariable name="" type="com.atlassian.bamboo.deployments.projects.actions.ConfigureDeploymentProjectVersioning" --]

[#assign headerText]
    [@ww.text name="deployment.project.version.title"]
        [@ww.param]${(deploymentProject.name)!''}[/@ww.param]
    [/@ww.text]
[/#assign]

<html>
<head>
[@ui.header pageKey=headerText title=true/]
    <meta name="bodyClass" content="aui-page-focused aui-page-focused-xlarge"/>
</head>
<body>

<div class="toolbar aui-toolbar inline">[@help.url pageKey="deployments.versioning.howtheywork"][@ww.text name="deployments.versioning.howtheywork.title"/][/@help.url]</div>
[@ui.header pageKey=headerText headerElement='h2'/]

[@ww.form action="saveDeploymentProjectVersioning" namespace="/deploy/config" submitLabelKey="global.buttons.update" cancelUri='/deploy/config/configureDeploymentProject.action?id=${id}' descriptionKey="deployment.project.version.description"]
    [@ww.hidden name="id"/]
    <h3>[@ww.text name="deployment.project.version.createname" /]</h3>

    <div class="deployment-project-version-naming">
        [#assign previewButton]
            [#if action.deploymentProjectPlanConfigured]
                [@cp.displayLinkButton buttonId='preview-button' buttonLabel='deployment.project.version.preview.button' buttonUrl=""/]
            [/#if]
        [/#assign]
        [@ww.textfield id="next-version"  labelKey='deployment.project.version.next' name='nextVersion' required=true cssClass="long-field" after=previewButton /]
        [#if action.deploymentProjectPlanConfigured]
            <a class="add-variable">[@ww.text name="deployment.project.version.addvariable" /]</a>
        [/#if]
        [@s.checkbox labelKey='deployment.project.version.applies.to.branches' name='applicableToBranches'/]
    </div>

    [#if action.deploymentProjectPlanConfigured]

    <h3>[@ww.text name="deployment.project.version.autoincrement"/]</h3>
    [@ww.text name="deployment.project.version.autoincrement.description"/]

    <fieldset class="group">
        <legend>
            <span>[@ww.text name="deployment.project.version.autoincrement.numbers"/]</span>
        </legend>
        [@ww.checkbox labelKey='deployment.project.version.autoincrement.numbers.last' name='autoIncrement'/]
    </fieldset>

    ${soy.render("bamboo.deployments:configure-deployment-project", "bamboo.page.deployment.project.versioning.variableIncrementContainer", {})}

    <h3>[@ww.text name="deployment.project.version.preview"/]</h3>
    <div class="aui-group">
        <div id="version-preview" class="aui-item" >
            [@ui.icon type="loading" /]
        </div>
        <div class="aui-item version-preview-hint">
            [@ww.text name='deployment.project.version.preview.hint.title'/]
            <p>[@ww.text name='deployment.project.version.preview.hint.message'/]</p>
        </div>
    </div>

    <script type="text/javascript">
        require(['jquery', 'page/deployment/deployment-project-versioning'], function($, deploymentProjectVersioning){
            deploymentProjectVersioning.init({
                deploymentProjectId: ${deploymentProject.id},
                addVariableDialogUrl: "${req.contextPath}/rest/api/latest/deploy/projectVersioning/${deploymentProject.id}/variables",
                versionPreviewUrl: "${req.contextPath}/rest/api/latest/deploy/projectVersioning/${deploymentProject.id}/namingPreview",
                versionVariablesUrl: "${req.contextPath}/rest/api/latest/deploy/projectVersioning/${deploymentProject.id}/parseVariables",
                currentlySelectedVariables: $.parseJSON("${action.toJson(variablesToAutoIncrement)?js_string}"),
                selectors: {
                    addVariable: ".add-variable",
                    nextVersion: "#next-version",
                    versionPreview: "#version-preview",
                    versionPreviewButton: "#preview-button",
                    variableCheckboxList: "#variable-increment-checkboxes",
                    form: "#saveDeploymentProjectVersioning"
                }
            });
        });
    </script>

    [#else]

        [#-- if plan is not set (e.g. because it was deleted) --]
        [@ui.messageBox type='error' titleKey='deployment.project.version.error.no.plan']
            [@s.text name='deployment.project.version.error.no.plan.description' /]
        [/@ui.messageBox]
    [/#if]
[/@ww.form]

</body>
</html>
