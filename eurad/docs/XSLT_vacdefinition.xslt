﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>


  <xsl:template name="VACDefinition">
    <tr class="cellstyle">
      <td class="style1">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        </a>
      </td>
      <td class="style1">
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="VACStep">
    <tr class="cellstyle">
      <xsl:choose>
        <xsl:when test="link[@name='DetailingVACDefinition']/object">
          <xsl:for-each select="link[@name='DetailingVACDefinition']/object">
            <xsl:call-template name="VACDefinition"></xsl:call-template>
          </xsl:for-each>
        </xsl:when>
        <xsl:otherwise>
          <td class="style1">
            <xsl:value-of select="attribute[@name='Name']/text()"/>
          </td>
          <td class="style1">
            <xsl:value-of disable-output-escaping="yes" select="doc"/>
          </td>
        </xsl:otherwise>
      </xsl:choose>
    </tr>
  </xsl:template>


  <xsl:template name="vacdiagram">
    <tr class="cellstyle">
      <td class="style1">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        </a>
      </td>
      <td class="style1">
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="diagram">
    <tr class="cellstyle">
      <td class="style1">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='PresentationName']/text()"/>
        </a>
      </td>
      <td class="style1">
      </td>
    </tr>

  </xsl:template>




  <xsl:template match="contents">
    <html>
      <head>
        <META http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Modlr Process</title>
        <LINK REL="StyleSheet" HREF="style.css" TYPE="text/css" />
      </head>
      <body>
        <h1 class="HeaderMain" >
          <xsl:text>Process </xsl:text>
          <xsl:value-of select="object/attribute[@name='Name']/text()"/>
        </h1>        
        <p>
          <xsl:value-of disable-output-escaping="yes" select="object/doc"/>
        </p>

        <h1 class="subheader" >Steps</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='VACSteps']/object">
            <xsl:call-template name="VACStep"></xsl:call-template>
          </xsl:for-each>
        </table>
        <h1 class="subheader" >Used as step in Processes</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='UsedInVACSteps']/object/link[@name='VACDefinition']/object">
            <xsl:call-template name="VACDefinition"></xsl:call-template>
          </xsl:for-each>
        </table>
        <h1 class="subheader" >Reference to diagrams</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='Diagrams']/object">
            <xsl:sort select="attribute[@name='Name']/text()"
                      order="ascending"/>
            <xsl:call-template name="diagram"></xsl:call-template>
          </xsl:for-each>
        </table>
        <h1 class="subheader" >Placed in diagrams</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='PlacedVAC']/object/link[@name='VACDiagram']/object">
            <xsl:sort select="attribute[@name='Name']/text()"
                      order="ascending"/>
            <xsl:call-template name="vacdiagram"></xsl:call-template>
          </xsl:for-each>
        </table>
        <p>
        </p>
        <a class="backtoindex">
          <xsl:attribute name="href">
            <xsl:text>index.htm</xsl:text>
          </xsl:attribute>
          <xsl:text>Back to index</xsl:text>
        </a>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
