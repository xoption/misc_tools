DECLARE @port varchar(5)

EXEC xp_regread @rootkey='HKEY_LOCAL_MACHINE',
@key='SOFTWARE\Microsoft\MSSQLServer\MSSQLServer\SuperSocketNetLib\Tcp',
@value_name='TcpPort',
@value=@port OUTPUT

PRINT @port
