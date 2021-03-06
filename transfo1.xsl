<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/assurance">
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Transformation 1</title>
    <link rel="stylesheet" type="text/css" href="theme.css" />
</head>
<body>
    <h2>Liste des employes et de leurs informations</h2>
    <table class="table_container" border="1">
        <tr>
            <th>Identifiant</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Adresse</th>
            <th>Salaire</th>
        </tr>
        <xsl:apply-templates select="/assurance/employes/employe"/>
    </table>
    
    <h2>Liste des clients et de leurs informations</h2>
    <table class="table_container" border="1">
        <tr>
            <th>Indentifiant</th>
            <th>Nom</th>
            <th>Prenom</th>
            <th>Adresse</th>
        </tr>
        <xsl:apply-templates select="/assurance/clients/client"/>
    </table>
    
    <h2>Liste des contrats, des cotisations et des indemnités</h2>
    <table class="table_container" border="1">
        <tr>
            <th>Type de contrat</th>
            <th>Cotisation</th>
            <th>Indemnités</th>
        </tr>
        <xsl:apply-templates select="/assurance/contrats/contrat"/>
    </table>
    
</body>
</html>
</xsl:template>

<xsl:template match="/assurance/contrats/contrat">
    <tr>
        <td><xsl:value-of select="@type"/></td>
        <td><xsl:value-of select="cotisation"/></td>
        <td><xsl:value-of select="indemnites"/></td>
    </tr>
</xsl:template>

<xsl:template match="/assurance/clients/client">
    <tr>
        <td><xsl:value-of select="@id_c"/></td>
        <td><xsl:value-of select="@nom_c"/></td>
        <td><xsl:value-of select="@prenom_c"/></td>
        <td><xsl:value-of select="@adresse_c"/></td>
    </tr>
</xsl:template>

<xsl:template match="/assurance/employes/employe">
    <tr>
        <td><xsl:value-of select="@id_e"/></td>
        <td><xsl:value-of select="@nom_e"/></td>
        <td><xsl:value-of select="@prenom_e"/></td>
        <td><xsl:value-of select="@adresse_e"/></td>
        <td><xsl:value-of select="@salaire"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>
