<#import "template.ftl" as layout>
<@layout.mainLayout active='applications' bodyClass='applications'; section>

    <div class="row">
        <div class="col-md-10">
            <h2>${msg("applicationsHtmlTitle")}</h2>
        </div>
    </div>

    <form action="${url.applicationsUrl}" method="post">
        <input type="hidden" id="stateChecker" name="stateChecker" value="${stateChecker}">
        <input type="hidden" id="referrer" name="referrer" value="${stateChecker}">

        <table class="table table-striped table-bordered">
            <thead>
              <tr>
                <td>${msg("application")}</td>
                <td>URL</td>
              </tr>
            </thead>

            <tbody>
              <#list applications.applications as application>
              <#list application.resourceRolesAvailable?keys as resource>
              <#list application.resourceRolesAvailable[resource] as clientRole>
              <#if application.client.rootUrl?has_content && application.client.clientId == clientRole.clientId && clientRole.roleName == "access">

              <tr>
                <td>
                  <a href="${application.client.rootUrl}">
                  <#if application.client.name?has_content>${advancedMsg(application.client.name)}<#else>${application.client.clientId}</#if>
                  </a>
                </td>
                <td>
                  <a href="${application.client.rootUrl}">${application.client.rootUrl}</a>
                </td>
              </tr>

              </#if>
              </#list>
              </#list>
              </#list>
            </tbody>
        </table>
    </form>

</@layout.mainLayout>
