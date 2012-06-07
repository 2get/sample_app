xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Feed of #{@user.name}"
    xml.description "Rails. Feed of user."

    for micropost in @microposts
      xml.item do
        xml.title micropost.id
        xml.description micropost.content
        xml.pubDate micropost.created_at.to_s(:rfc822)
      end
    end
  end
end
