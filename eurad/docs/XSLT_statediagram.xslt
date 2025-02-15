﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>


  <xsl:template name="placedstate">
    <tr class="cellstyle">
      <td class="style1">
            <xsl:value-of select="attribute[@name='LastKnownName']/text()"/>
      </td>
      <td class="style1">
        <xsl:value-of disable-output-escaping="yes" select="link[@name='Vertex']/object/doc"/>
      </td>
    </tr>

  </xsl:template>



  <xsl:template match="contents">
    <html>
      <head>
        <META http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Modlr StateDiagram</title>
        <LINK REL="StyleSheet" HREF="style.css" TYPE="text/css" />
      </head>
      <body>
        <h1 class="HeaderMain" >
          <xsl:text>State diagram for </xsl:text>
          <xsl:value-of select="object/link[@name='Attribute']/object/link[@name='Owner']/object/attribute[@name='Name']/text()"/>
          <xsl:text>:</xsl:text>
          <xsl:value-of select="object/link[@name='Attribute']/object/attribute[@name='Name']/text()"/>
        </h1>
        <img>
          <xsl:attribute name="src">
            <xsl:value-of select="object/modlrdiagram/text()"/>
          </xsl:attribute>
        </img>
        <p>
          <xsl:value-of disable-output-escaping="yes" select="object/doc"/>
        </p>

        <h1 class="subheader" >States</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="object/link[@name='PlacedState']/object">
            <xsl:sort select="attribute[@name='LastKnownName']/text()"
                      order="ascending"/>
            <xsl:call-template name="placedstate"></xsl:call-template>
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
