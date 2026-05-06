<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math"
    exclude-result-prefixes="xs math"
    version="3.0">
    <xsl:variable name="totalCredit">
        <xsl:value-of select="sum(/releve/operations/operation[@type='CREDIT']/@montant)"/>
    </xsl:variable>
    
    <xsl:variable name="totalDebit">
        <xsl:value-of select="sum(/releve/operations/operation[@type='DEBIT']/@montant)"/>
    </xsl:variable>
    
    <xsl:template match="/releve">
        <html>
            <head>
                <title>Relevé Bancaire</title>
                <style>
                    table { border-collapse: collapse; width: 100%; }
                    th, td { border: 1px solid black; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    .credit { color: green; }
                    .debit { color: red; }
                    .total { font-weight: bold; background-color: #e0e0e0; }
                </style>
            </head>
            <body>
                <h1>Relevé Bancaire</h1>
                <p><strong>RIB :</strong> <xsl:value-of select="@RIB"/></p>
                <p><strong>Date du relevé :</strong> <xsl:value-of select="dateReleve"/></p>
                <p><strong>Solde :</strong> <xsl:value-of select="solde"/> DH</p>
                
                <h2>Liste des opérations</h2>
                <p><strong>Période :</strong> 
                    <xsl:value-of select="operations/@dateDebut"/> au 
                    <xsl:value-of select="operations/@dateFin"/>
                </p>
                
                <table>
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant (DH)</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="operations/operation">
                        <tr>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="@type='CREDIT'">
                                        <span class="credit">CREDIT</span>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <span class="debit">DEBIT</span>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                
                <h3>Récapitulatif</h3>
                <table style="width: 50%;">
                    <tr class="total">
                        <td><strong>Total des CRÉDITS :</strong></td>
                        <td class="credit"><strong><xsl:value-of select="$totalCredit"/> DH</strong></td>
                    </tr>
                    <tr class="total">
                        <td><strong>Total des DÉBITS :</strong></td>
                        <td class="debit"><strong><xsl:value-of select="$totalDebit"/> DH</strong></td>
                    </tr>
                    <tr class="total">
                        <td><strong>Solde après opérations :</strong></td>
                        <td>
                            <strong>
                                <xsl:value-of select="solde + $totalCredit - $totalDebit"/> DH
                            </strong>
                        </td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>