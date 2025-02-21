# Use Windows Server Core with IIS
FROM mcr.microsoft.com/windows/servercore/iis

# Copy website files to IIS webroot
COPY index.html C:\inetpub\wwwroot\index.html
COPY styles.css C:\inetpub\wwwroot\styles.css

# Expose port 80
EXPOSE 70

# Health check using PowerShell
HEALTHCHECK --interval=30s --timeout=5s --retries=3 `
    CMD powershell -command `
    try { `
        $response = Invoke-WebRequest -UseBasicParsing http://localhost; `
        if ($response.StatusCode -eq 200) { exit 0 } else { exit 1 } `
    } catch { exit 1 }

# Start IIS
CMD ["powershell", "Start-Service", "W3SVC", "-PassThru", ";", "wait-process", "-Name", "w3wp"]
