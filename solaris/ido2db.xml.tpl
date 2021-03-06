<?xml version="1.0"?>
<!DOCTYPE service_bundle SYSTEM "/usr/share/lib/xml/dtd/service_bundle.dtd.1">
<service_bundle type='manifest' name='icinga'>
	<service name='application/network/icinga-db' type='service' version='1'>

		<create_default_instance enabled='false' />
		<single_instance />
		<dependency name='network' grouping='require_all' restart_on='none' type='service'>
			<service_fmri value='svc:/milestone/network:default' />
		</dependency>

		<dependency name='icinga_cfg_file' grouping='require_all' restart_on='none' type='path'>
			<service_fmri value='file://localhost!CFGPREFIX!/ido2db.cfg' />
		</dependency>

		<exec_method type='method' name='start'   exec='/lib/svc/method/ido2db start' timeout_seconds='60' />
		<exec_method type='method' name='restart' exec='/lib/svc/method/ido2db restart' timeout_seconds='60' />
		<exec_method type='method' name='refresh' exec='/lib/svc/method/ido2db reload' timeout_seconds='60' />
		<exec_method type='method' name='stop'    exec=':kill' timeout_seconds='60' />
        
		<stability value="Unstable" />
		<template>
			<common_name>
				<loctext xml:lang="C">Icinga database connector</loctext>
			</common_name>
		</template>
	</service>
</service_bundle>
