
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

if ($args[0] -eq $null)
{
	throw "Vous devez renseigner le nom du projet."
}

if ($args[1] -ne $null)
{
		throw "Vous ne pouvez mettre qu'un seul nom de projet. Utilisez des guillemets si besoin."
}

# téléchargement de telegraf via web request
#Invoke-WebRequest https://dl.influxdata.com/telegraf/releases/telegraf-1.13.3_windows_amd64.zip -OutFile C:\telegraf.zip -UseBasicParsing

# unzip et suppr l'archive
Expand-Archive C:\telegraf.zip -DestinationPath C:\
rm C:\telegraf.zip

# création des dossiers de conf et logs
mkdir C:\telegraf\telegraf.d
mkdir C:\telegraf\logs

# suppression fichier de conf
del C:\telegraf\telegraf.conf


ADD-content -path "C:\telegraf\telegraf.conf" -value '[global_tags]
projet = "projet_var_to_replace"
[agent]
  interval = "10s"
  round_interval = true
  metric_batch_size = 1000
  metric_buffer_limit = 10000
  collection_jitter = "0s"
  flush_interval = "10s"
  flush_jitter = "0s"
  precision = ""
  hostname = ""
  omit_hostname = false


###############################################################################
#                            OUTPUT PLUGINS                                   #
###############################################################################


# Configuration for sending metrics to InfluxDB
[[outputs.influxdb]]
  urls = ["http://192.168.3.132:8086"]
  database = "telegraf"
   username = "CHANGEME"
   password = "CHANGEME"


###############################################################################
#                            INPUT PLUGINS                                    #
###############################################################################

  [[inputs.cpu]]
  percpu = true
  totalcpu = true
  collect_cpu_time = false

  [[inputs.mem]]

  [[inputs.disk]]

  [[inputs.diskio]]

  [[inputs.io]]

  [[inputs.processes]]

  [[inputs.swap]]

  [[inputs.system]]

  [[inputs.net]]'


ADD-content -path "C:\telegraf\telegraf.d\win_perf_counters.conf" -value '[[inputs.win_perf_counters]]
  [[inputs.win_perf_counters.object]]
    ObjectName = "Processor"
    Instances = ["*"]
    Counters = [
      "% Idle Time",
      "% Interrupt Time",
      "% Privileged Time",
      "% User Time",
      "% Processor Time",
      "% DPC Time",
    ]
    Measurement = "cpu"
    IncludeTotal=true

  [[inputs.win_perf_counters.object]]
    ObjectName = "LogicalDisk"
    Instances = ["*"]
    Counters = [
      "% Idle Time",
      "% Disk Time",
      "% Disk Read Time",
      "% Disk Write Time",
      "Current Disk Queue Length",
      "% Free Space",
      "Free Megabytes",
    ]
    Measurement = "disk"

  [[inputs.win_perf_counters.object]]
    ObjectName = "PhysicalDisk"
    Instances = ["*"]
    Counters = [
      "Disk Read Bytes/sec",
      "Disk Write Bytes/sec",
      "Current Disk Queue Length",
      "Disk Reads/sec",
      "Disk Writes/sec",
      "% Disk Time",
      "% Disk Read Time",
      "% Disk Write Time",
    ]
    Measurement = "diskio"

  [[inputs.win_perf_counters.object]]
    ObjectName = "Network Interface"
    Instances = ["*"]
    Counters = [
      "Bytes Received/sec",
      "Bytes Sent/sec",
      "Packets Received/sec",
      "Packets Sent/sec",
      "Packets Received Discarded",
      "Packets Outbound Discarded",
      "Packets Received Errors",
      "Packets Outbound Errors",
    ]
    Measurement = "net"

  [[inputs.win_perf_counters.object]]
    ObjectName = "System"
    Counters = [
      "Context Switches/sec",
      "System Calls/sec",
      "Processor Queue Length",
      "System Up Time",
    ]
    Instances = ["------"]
    Measurement = "system"

  [[inputs.win_perf_counters.object]]
    ObjectName = "Memory"
    Counters = [
      "Available Bytes",
      "Cache Faults/sec",
      "Demand Zero Faults/sec",
      "Page Faults/sec",
      "Pages/sec",
      "Transition Faults/sec",
      "Pool Nonpaged Bytes",
      "Pool Paged Bytes",
      "Standby Cache Reserve Bytes",
      "Standby Cache Normal Priority Bytes",
      "Standby Cache Core Bytes",

    ]
    Instances = ["------"]
    Measurement = "mem"
    IncludeTotal=true

  [[inputs.win_perf_counters.object]]
    ObjectName = "Paging File"
    Counters = [
      "% Usage",
    ]
    Instances = ["_Total"]
    Measurement = "swap"'

# récupération du tag group
# $projet = Get-Content -Path C:\temp\project.txt
# (Get-Content -path "C:\telegraf\telegraf.conf" -Raw) -replace 'projet_var_to_replace',$projet | Set-Content "C:\telegraf\telegraf.conf"

# récupération du tag group en mode argument
$projet_arg=$args[0]
(Get-Content -path "C:\telegraf\telegraf.conf" -Raw) -replace 'projet_var_to_replace',$projet_arg | Set-Content "C:\telegraf\telegraf.conf"

# test
# C:\telegraf\telegraf.exe --config=C:\telegraf\telegraf.conf --config-directory=C:\telegraf\telegraf.d --test

# installation
C:\telegraf\telegraf.exe --service install --config C:\telegraf\telegraf.conf --config-directory C:\telegraf\telegraf.d

# service start
net start telegraf



# TODO :
# Une entrée dfans le formulaire de demande de vm sera ajoutée et le nom du groupe de la vm sera précisé dans un ficher .txt dans C:\Temp ou autre -> l'utiliser pour le tag
# Et le script sera lancé après la copie de la template
