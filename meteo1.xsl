<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="3.0">
    <xsl:template match="/">
        <head>
            <title>Meteo</title>
        </head>
        <body>
            <xsl:for-each select="meteo/mesure">
                <ul>
                    <li>Date: <xsl:value-of select="@date"/></li>
                </ul>
            </xsl:for-each>
        </body>
        
    </xsl:template>
    
</xsl:stylesheet>