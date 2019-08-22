FROM mcr.microsoft.com/windows/servercore:1803


RUN PowerShell -NoProfile -Command Add-WindowsFeature web-server
RUN powershell -NoProfile -Command Remove-Item -Recurse C:\inetpub\wwwroot\*
RUN cmd /c echo "<h1 align=center><font color='blue'>Test IIS From Container</h1></font>" >C:\inetpub\wwwroot\index.html
WORKDIR /inetpub/wwwroot
COPY Recurring.ps1 .
EXPOSE 80
ENTRYPOINT ["powershell","/inetpub/wwwroot/Recurring.ps1"] 
