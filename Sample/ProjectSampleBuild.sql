--------------------------------------------------------------------------------
-- FILE                : ProjectSampleBuild.sql
-- CREATED BY/DATE     : DBArtisan on 2/16/2021 10:53:11.809
-- COMMENTS            : Built from project ProjectSample
--------------------------------------------------------------------------------

create table emp (empno number(5) primary key,
                   name varchar2(20),
                   sal number(10,2),
                   job varchar2(20),
                   mgr  number(5),
                   Hiredate  date,
                   comm number(10,2));
create table dept(  
  deptno     number(2,0),  
  dname      varchar2(14),  
  loc        varchar2(13),  
  constraint pk_dept primary key (deptno)  
)

create table emp(  
  empno    number(4,0),  
  ename    varchar2(10),  
  job      varchar2(9),  
  mgr      number(4,0),  
  hiredate date,  
  sal      number(7,2),  
  comm     number(7,2),  
  deptno   number(2,0),  
  constraint pk_emp primary key (empno),  
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
)

insert into DEPT (DEPTNO, DNAME, LOC)
values(10, 'ACCOUNTING', 'NEW YORK')
/
insert into dept  
values(20, 'RESEARCH', 'DALLAS')
/
insert into dept  
values(30, 'SALES', 'CHICAGO')
/
insert into dept  
values(40, 'OPERATIONS', 'BOSTON')
/
insert into emp  
values(  
 7839, 'KING', 'PRESIDENT', null,  
 to_date('17-11-1981','dd-mm-yyyy'),  
 5000, null, 10  
)
/
insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 to_date('1-5-1981','dd-mm-yyyy'),  
 2850, null, 30  
)
/
insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 to_date('9-6-1981','dd-mm-yyyy'),  
 2450, null, 10  
)
/
insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
 to_date('2-4-1981','dd-mm-yyyy'),  
 2975, null, 20  
)
/
insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 to_date('13-JUL-87','dd-mm-rr') - 85,  
 3000, null, 20  
)
/
insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 3000, null, 20  
)
/
insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 to_date('17-12-1980','dd-mm-yyyy'),  
 800, null, 20  
)
/
insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 to_date('20-2-1981','dd-mm-yyyy'),  
 1600, 300, 30  
)
/
insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
 to_date('22-2-1981','dd-mm-yyyy'),  
 1250, 500, 30  
)
/
insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 to_date('28-9-1981','dd-mm-yyyy'),  
 1250, 1400, 30  
)
/
insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 to_date('8-9-1981','dd-mm-yyyy'),  
 1500, 0, 30  
)
/
insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
 to_date('13-JUL-87', 'dd-mm-rr') - 51,  
 1100, null, 20  
)
/
insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 950, null, 30  
)
/
insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 to_date('23-1-1982','dd-mm-yyyy'),  
 1300, null, 10  
)
/
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

BEGIN
    FOR
        l_counter IN
        1 ..
        5 LOOP
        DBMS_OUTPUT.PUT_LINE (l_counter);
    END LOOP;
END;
--Added  by Anil

create table tax (empno number(5), tax number(10,2));
                                              
