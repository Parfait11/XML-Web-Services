<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:template match="/releve">
        <html>
            <head>
                <title>Opérations CREDIT</title>
                <style>
                    body { font-family: Arial, sans-serif; }
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid #4CAF50; padding: 8px; text-align: left; }
                    th { background-color: #4CAF50; color: white; }
                    tr:nth-child(even) { background-color: #f2f2f2; }
                    .header { background-color: #e8f5e9; padding: 10px; border-radius: 5px; }
                </style>
            </head>
            <body>
                <div class="header">
                    <h1>Relevé Bancaire - Opérations CREDIT</h1>
                    <p><strong>RIB :</strong> <xsl:value-of select="@RIB"/></p>
                    <p><strong>Date relevé :</strong> <xsl:value-of select="dateReleve"/></p>
                    <p><strong>Période :</strong> 
                        <xsl:value-of select="operations/@dateDebut"/> au 
                        <xsl:value-of select="operations/@dateFin"/>
                    </p>
                </div>
                
                <h2>Liste des crédits</h2>
                
                <!-- Vérification s'il y a des opérations CREDIT -->
                <xsl:choose>
                    <xsl:when test="count(operations/operation[@type='CREDIT']) > 0">
                        <table>
                            <tr>
                                <th>Date</th>
                                <th>Montant (DH)</th>
                                <th>Description</th>
                            </tr>
                            <xsl:for-each select="operations/operation[@type='CREDIT']">
                                <tr>
                                    <td><xsl:value-of select="@date"/></td>
                                    <td><strong><xsl:value-of select="@montant"/> DH</strong></td>
                                    <td><xsl:value-of select="@description"/></td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        
                        <h3>Total des crédits : 
                            <span style="color: green; font-size: 1.2em;">
                                <xsl:value-of select="sum(operations/operation[@type='CREDIT']/@montant)"/> DH
                            </span>
                        </h3>
                    </xsl:when>
                    <xsl:otherwise>
                        <p><em>Aucune opération de type CREDIT sur cette période.</em></p>
                    </xsl:otherwise>
                </xsl:choose>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>