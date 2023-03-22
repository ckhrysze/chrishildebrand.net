defmodule CkhryszeWeb.Articles.XmlAndPdf do
  use CkhryszeWeb, :html

  @behaviour CkhryszeWeb.Article

  def date, do: ~D[2016-11-06]
  def title, do: "XML and PDF"
  def desc, do: "XML and PDF"
  def keywords, do: ~w[pdf]
  def tags, do: ~w[thoughts pdf]

  def render(assigns) do
    ~H"""


<p>I seem to have a knack for picking up a lot of the indirect work needed to produce a software product. It may be a
  willingness to just do what is needed regardless of how glamorous. It may be that I am futher than many of my peers on
  the path of "getting comfortable being uncomfortable". However it came to be, I can think of several places in my
  career that fit this mold, and the two technologies that seem to reoccur are XML and PDF.</p>

<p>My experience with XML started very early. During college many of my CS courses used Java for assignments and
  projects, and xml was already the defacto config format. In my first job post college, we made heavy used of SOAP, and
  lighter use of XSLT. When something needed to be debugged at the transport layer, it often went to me. When the
  generated WSDL file needed to be updated by hand, that also went to me.</p>

<p>At my next position, also a Java shop at the time, we again used SOAP rather heavily. We transitioned to more
  REST-like services while I was there, and needed a way to support both until the depricated service hit its end of
  life date. For that, I was asked to maintain a XSLT layer to translate incoming SOAP requests to the new service, and
  then translate the responses on the way out. I later transitioned to a new project using Ruby on Rails, and went to a
  Windy City Rails conference. There I learned about <a href="https://github.com/prawnpdf/prawn">Prawn</a> and my
  relationship with the PDF format began.</p>

<p>Other than a little bit of side work, I didn't do a lot with PDFs until I needed to generate reports for regulators a
  couple jobs later. The only formats they accepted were doc and PDF, and PDF was far easier for me to create, <a
    href="https://github.com/ckhrysze/fff">so I did</a> (project no longer maintained). About this time my oldest had
  need of school supplements (spelling sheets, states and capitals, math worksheets), and PDFs made with Prawn again was
  the easiest way for me to create something quickly that would print how I wanted it to.</p>

<p>I've done a few other projects since then. More report generation with <a
    href="http://www.reportlab.com/opensource/">ReportLab</a>, a PDF slicing project that used <a
    href="https://github.com/yob/pdf-reader">pdf-reader</a> and <a href="http://www.ghostscript.com/">Ghostscript</a>,
  and most recently the updates to <a href="https://github.com/ckhrysze/prawnresume">my resume</a>.</p>

<p>There is no central point or lesson, other than perhaps don't fear taking on the side work others want to avoid. The
  inspiration was really just looking back on the journey that made updating my resume with a pdf generation library
  seem like a remotely reasonable thing to do.</p>
"""
  end
end
