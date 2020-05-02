@echo OFF
chcp 65001

CALL :StopAndDisableService "wuauserv", "Windows Update"
CALL :StopAndDisableService "BITS", "Transferência inteligente"
CALL :StopAndDisableService "DoSvc", "Otimização de Entrega"
CALL :StopAndDisableService "WSearch", "Windows Search"

pause
EXIT /B %ERRORLEVEL%

:StopAndDisableService
    echo.
    echo [%~2]
    sc stop %~1
    sc config %~1 start=disabled
EXIT /B 0