require 'rails_helper'

describe ActsAsCitable do
  describe "acts_as_citable" do
    context "with defaults" do
      let(:model_class){ CitableRecord }
      let(:record){ CitableRecord.new(data: "itemType: book", format: "csf") }

      describe "to_ris" do
        subject{ record.to_ris }
        it { is_expected.to eq "TY  - BOOK\nER  -\n\n" }
      end
      describe "to_bibtex" do
        subject{ record.to_bibtex }
        it { is_expected.to eq "@book{????\n}" }
      end
      describe "to_openurl" do
        subject{ record.to_openurl }
        it { is_expected.to eq "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book" }
      end
      describe "to_easybib" do
        subject{ record.to_easybib }
        it { is_expected.to eq "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[]}" }
      end
      describe "to_csf" do
        subject{ record.to_csf }
        it { is_expected.to eq "itemType: book" }
      end
      describe "to_refworks_tagged" do
        subject{ record.to_refworks_tagged }
        it { is_expected.to eq "RT Book, whole\nER \n \n" }
      end
      describe "csf" do
        subject{ record.csf }
        it { is_expected.to be_present }
      end

      describe "to_apa" do
        subject{ record.to_apa }
        it { is_expected.to eq "<div class=\"csl-bib-body\">\n  <div class=\"csl-entry\"> (n.d.).</div>\n</div>" }
      end
      describe "to_mla" do
        subject{ record.to_mla }
        it { is_expected.to eq "<div class=\"csl-bib-body\">\n  <div class=\"csl-entry\"> Print.</div>\n</div>" }
      end
      describe "to_chicago_author_date" do
        subject{ record.to_chicago_author_date }
        it { is_expected.to eq "<div class=\"csl-bib-body\">\n\n[CSL STYLE ERROR: reference with no printed form.]\n</div>" }
      end

      describe "self.format_field" do
        subject{ model_class.format_field }
        it { is_expected.to eq "format" }
      end
      describe "self.data_field" do
        subject{ model_class.data_field }
        it { is_expected.to eq "data" }
      end
    end

    context "with custom non-default fields" do
      let(:model_class){ CustomCitableRecord }
      let(:record){ CustomCitableRecord.new(my_data: "itemType: book", my_format: "csf") }

      describe "to_ris" do
        subject{ record.to_ris }
        it { is_expected.to eq "TY  - BOOK\nER  -\n\n" }
      end
      describe "to_bibtex" do
        subject{ record.to_bibtex }
        it { is_expected.to eq "@book{????\n}" }
      end
      describe "to_openurl" do
        subject{ record.to_openurl }
        it { is_expected.to eq "rft.ulr_ver=Z39.88-2004&rft.ctx_ver=Z39.88-2004&rfr_id=info:sid/libraries.nyu.edu:citero&rft_val_fmlt=info:ofi/fmt:kev:mtx:book&rft.genre=book" }
      end
      describe "to_easybib" do
        subject{ record.to_easybib }
        it { is_expected.to eq "{\"source\":\"book\",\"book\":{\"title\":null},\"pubtype\":{\"main\":\"pubnonperiodical\"},\"pubnonperiodical\":{},\"contributors\":[]}" }
      end
      describe "to_csf" do
        subject{ record.to_csf }
        it { is_expected.to eq "itemType: book" }
      end
      describe "to_refworks_tagged" do
        subject{ record.to_refworks_tagged }
        it { is_expected.to eq "RT Book, whole\nER \n \n" }
      end
      describe "csf" do
        subject{ record.csf }
        it { is_expected.to be_present }
      end

      describe "to_apa" do
        subject{ record.to_apa }
        it { is_expected.to eq "<div class=\"csl-bib-body\">\n  <div class=\"csl-entry\"> (n.d.).</div>\n</div>" }
      end
      describe "to_mla" do
        subject{ record.to_mla }
        it { is_expected.to eq "<div class=\"csl-bib-body\">\n  <div class=\"csl-entry\"> Print.</div>\n</div>" }
      end
      describe "to_chicago_author_date" do
        subject{ record.to_chicago_author_date }
        it { is_expected.to eq "<div class=\"csl-bib-body\">\n\n[CSL STYLE ERROR: reference with no printed form.]\n</div>" }
      end

      describe "self.format_field" do
        subject{ model_class.format_field }
        it { is_expected.to eq :my_format }
      end
      describe "self.data_field" do
        subject{ model_class.data_field }
        it { is_expected.to eq "my_data" }
      end
    end
  end
end