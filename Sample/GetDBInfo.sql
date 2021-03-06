--Get DB Version and Banner
SELECT *
FROM v$database
/

--1. Tables with number of rows and comments
SELECT
    tab.owner AS schema_name,
    tab.table_name AS table_name,
    obj.created,
    obj.last_ddl_time AS last_modified,
    tab.num_rows,
    tab.last_analyzed,
    comm.comments
FROM
    all_tables tab
    INNER JOIN
    all_objects obj
    ON
        obj.owner = tab.owner AND
        obj.object_name = tab.table_name
    LEFT OUTER JOIN
    all_tab_comments comm
    ON
        tab.table_name = comm.table_name AND
        tab.owner = comm.owner
WHERE tab.owner NOT IN
    (
        'ANONYMOUS',
        'CTXSYS',
        'DBSNMP',
        'EXFSYS',
        'LBACSYS',
        'MDSYS',
        'MGMT_VIEW',
        'OLAPSYS',
        'OWBSYS',
        'ORDPLUGINS',
        'ORDSYS',
        'OUTLN',
        'SI_INFORMTN_SCHEMA',
        'SYS',
        'SYSMAN',
        'SYSTEM',
        'TSMSYS',
        'WK_TEST',
        'WKSYS',
        'WKPROXY',
        'WMSYS',
        'XDB',
        'APEX_040000',
        'APEX_PUBLIC_USER',
        'DIP',
        'FLOWS_30000',
        'FLOWS_FILES',
        'MDDATA',
        'ORACLE_OCM',
        'SPATIAL_CSW_ADMIN_USR',
        'SPATIAL_WFS_ADMIN_USR',
        'XS$NULL',
        'PUBLIC'
    )
--  and tab.owner = 'HR'
ORDER BY
    tab.owner,
    tab.table_name;
       /

--3. Views with their definition script and comments
--3. Views with their definition script and comments
SELECT
    obj.owner AS schema_name,
    obj.object_name AS view_name,
    obj.created,
    obj.last_ddl_time AS last_modified,
    def.text AS definition,
    comm.comments
FROM
    all_objects obj
    LEFT OUTER JOIN
    all_views def
    ON
        obj.owner = def.owner AND
        obj.object_name = def.view_name
    LEFT OUTER JOIN
    all_tab_comments comm
    ON
        obj.object_name = comm.table_name AND
        obj.owner = comm.owner
WHERE
    obj.object_type = 'VIEW' AND
    obj.owner NOT IN
    (
        'ANONYMOUS',
        'CTXSYS',
        'DBSNMP',
        'EXFSYS',
        'LBACSYS',
        'MDSYS',
        'MGMT_VIEW',
        'OLAPSYS',
        'OWBSYS',
        'ORDPLUGINS',
        'ORDSYS',
        'OUTLN',
        'SI_INFORMTN_SCHEMA',
        'SYS',
        'SYSMAN',
        'SYSTEM',
        'TSMSYS',
        'WK_TEST',
        'WKSYS',
        'WKPROXY',
        'WMSYS',
        'XDB',
        'APEX_040000',
        'APEX_PUBLIC_USER',
        'DIP',
        'FLOWS_30000',
        'FLOWS_FILES',
        'MDDATA',
        'ORACLE_OCM',
        'SPATIAL_CSW_ADMIN_USR',
        'SPATIAL_WFS_ADMIN_USR',
        'XS$NULL',
        'PUBLIC'
    )
--and obj.owner = 'HR'
ORDER BY
    obj.owner,
    obj.object_name;
        /

