Class shvarov.SQL.REST.Query Extends %CSP.REST
{

Parameter Version = "1.0.0";

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<!-- Server Info -->
<Route Url="/" Method="GET" Call="GetInfo" Cors="true"/>
<!-- Get all records of Person class -->
<Route Url="/query" Method="POST" Call="RunSQLQuery"/>

</Routes>
}

/// PersonsREST general information
ClassMethod GetInfo() As %Status
{
  SET version = ..#Version
  SET info = {
    "version": (version)
  }
  RETURN $$$OK
}

/// Run SQL query
ClassMethod RunSQLQuery() As %Status
{
    set sc = $$$OK
    Set data=%request.Content.Read()
    //s obj={}.%FromJSON(data) 
    s sc=##class(%ZEN.Auxiliary.jsonSQLProvider).%WriteJSONFromSQL(,data)

    return 1
}



ClassMethod SwaggerSpec() As %Status
{
  Set tSC = ##class(%REST.API).GetWebRESTApplication($NAMESPACE, %request.Application, .swagger)
  Do swagger.info.%Remove("x-ISC_Namespace")
  Set swagger.basePath = "/crud"
  Set swagger.info.title = "InterSystems IRIS REST CRUD demo"
  Set swagger.info.version = "0.1"
  Set swagger.host = "localhost:52773"
  Return $$$OK
}

}
