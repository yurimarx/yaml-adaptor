Class dc.yamladapter.YamlProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="dc.yamladapter.YamlProduction" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="JsonFileService" Category="" ClassName="EnsLib.File.PassthroughService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="DeleteFromServer">0</Setting>
    <Setting Target="Adapter" Name="FilePath">/tmp/samples</Setting>
    <Setting Target="Adapter" Name="FileSpec">*.json</Setting>
    <Setting Target="Host" Name="TargetConfigNames">JsonToYamlOperation</Setting>
  </Item>
  <Item Name="JsonToYamlOperation" Category="" ClassName="yamladaptor.JsonToYamlOperation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="FilePath">/tmp</Setting>
  </Item>
</Production>
}

}
