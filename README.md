# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...



My code
main/index.html.erb
<h1>Hello World</h1>

<p>
    <%= link_to 'Articles Listing', articles_path %> | 
    <%= link_to 'About Page', about_path %>
</p>

article/index.html.erb
<table>
    <thead>
        <tr>
            <th>S No.</th>
            <th>Title</th>
            <th colspan="3">Actions</th>
        </tr>
    </thead>

    <tbody>
        <% @i = 1 %>
        <% @articles.each do |article| %>
            <tr>
                <td><%= @i %></td>
                <td><%= article.title %></td>
                <td><%= link_to 'Show', article_path(article) %></td>
                <td><%= link_to 'Edit', edit_article_path(article) %></td>
                <td><%= link_to 'Delete', article_path(id: article.id), method: :delete %></td>
            </tr>
            <% @i = @i + 1 %>
        <% end %>
    </tbody>
</table>
<p>
    <%= link_to 'Create New Article', new_article_path %> |
    <%= link_to 'Home Page', root_path %>
</p>