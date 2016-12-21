<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
  <xsl:output method="html" indent="yes"/>


  <xsl:template name="package">
    <tr class="cellstyle">
      <td COLSPAN="2" class="style1">
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        <p>
          <xsl:value-of disable-output-escaping="yes" select="doc"/>
        </p>
      </td>
    </tr>
    <xsl:for-each select="link[@name='OwnedElement']/object">
      <xsl:sort select="attribute[@name='Name']/text()"
                order="ascending"/>
      <xsl:if test="@type='Class'">
        <xsl:call-template name="OneClass"></xsl:call-template>
      </xsl:if>
      <xsl:if test="@type='Package'">
        <xsl:call-template name="package"></xsl:call-template>
      </xsl:if>
    </xsl:for-each>

  </xsl:template>


  <xsl:template name="OneClass">
    <tr>
      <td width="10">

      </td>
      <td class="style2">        
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        </a>
      </td>
    </tr>
  </xsl:template>


  <xsl:template name="diagram">
    <tr class="newStyle1">
      <td class="style2">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        </a>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="vacdiagram">
    <tr class="newStyle1">
      <td class="style2">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        </a>
      </td>
    </tr>
  </xsl:template>

  <xsl:template name="vacdefinition">
    <tr class="newStyle1">
      <td class="style2">
        <a>
          <xsl:attribute name="href">
            <xsl:value-of select="@href"/>
            <xsl:text>.htm</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="attribute[@name='Name']/text()"/>
        </a>
      </td>
    </tr>

    <xsl:for-each select="link[@name='VACSteps']/object/link[@name='DetailingVACDefinition']/object">
      <xsl:sort select="attribute[@name='Name']/text()"
                order="ascending"/>
      <tr class="newStyle1">
        <td class="style2"><pre>      </pre><table style="width:100%;" class="newStyle1">
            <xsl:call-template name="vacdefinition"></xsl:call-template>
          </table>
        </td>
      </tr>
    </xsl:for-each>



  </xsl:template>


  <xsl:template match="contents">
    <html>
      <head>
        <META http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>Modlr Index</title>
        <LINK REL="StyleSheet" HREF="style.css" TYPE="text/css" />
      </head>
      <body>
        <h1 class="HeaderMain" >Modlr documentation</h1>
        <h1 class="subheader" >Processes</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="vacdefinitions/object">
            <xsl:sort select="attribute[@name='Name']/text()"
                      order="ascending"/>
            <xsl:call-template name="vacdefinition"></xsl:call-template>
          </xsl:for-each>
        </table>
        <br />
        <!--
        <h1 class="subheader" >Process diagrams</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="vacdiagrams/object">
            <xsl:sort select="attribute[@name='Name']/text()"
                      order="ascending"/>
            <xsl:call-template name="vacdiagram"></xsl:call-template>
          </xsl:for-each>
        </table>
        <br />
        <h1 class="subheader" >Class diagrams</h1>
        <table style="width:100%;" class="newStyle1">
          <xsl:for-each select="diagrams/object">
            <xsl:sort select="attribute[@name='Name']/text()"
                      order="ascending"/>
            <xsl:call-template name="diagram"></xsl:call-template>
          </xsl:for-each>
        </table>
        <br />-->
        <h1 class="subheader">Packages and classes</h1>
        <table style="width:100%;" align="left" class="newStyle1" >
          <xsl:for-each select="packages/object">
            <xsl:sort select="attribute[@name='Name']/text()"
                      order="ascending"/>
            <xsl:call-template name="package"></xsl:call-template>
          </xsl:for-each>
        </table>
        <p>
        </p>
      </body>
    </html>
  </xsl:template>

  <xsl:template match="@* | node()">
    <xsl:copy>
      <xsl:apply-templates select="@* | node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:stylesheet>
  