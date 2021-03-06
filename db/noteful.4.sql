-- psql -U dev -f ./db/noteful.4.sql -d noteful-test
-- SELECT CURRENT_DATE;

DROP TABLE IF EXISTS notes_tags;
DROP TABLE IF EXISTS notes;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS folders;

CREATE TABLE folders (
    id serial PRIMARY KEY,
    name text NOT NULL UNIQUE
);
ALTER SEQUENCE folders_id_seq RESTART WITH 100;

CREATE TABLE tags (
  id serial PRIMARY KEY,
  name text NOT NULL UNIQUE
);

CREATE TABLE notes (
  id serial PRIMARY KEY,
  title text NOT NULL,
  content text,
  created timestamp DEFAULT now()
);

ALTER SEQUENCE notes_id_seq RESTART WITH 1000;
ALTER TABLE notes ADD COLUMN folder_id int REFERENCES folders ON DELETE SET NULL; -- or RESTRICT

CREATE TABLE notes_tags (
  note_id INTEGER NOT NULL REFERENCES notes ON DELETE CASCADE,
  tag_id INTEGER NOT NULL REFERENCES tags ON DELETE CASCADE
);

-- INSERT INTO folders (name) VALUES
--   ('Archive'),
--   ('Drafts'),
--   ('Personal'),
--   ('Work');

-- INSERT INTO notes (title, content, folder_id) VALUES 
--   (
--     '5 life lessons learned from cats',
--     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
--     100
--   ),
--   (
--     'What the government doesn''t want you to know about cats',
--     'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Velit egestas dui id ornare arcu odio. Molestie at elementum eu facilisis sed odio morbi. Tempor nec feugiat nisl pretium. At tempor commodo ullamcorper a lacus. Egestas dui id ornare arcu odio. Id cursus metus aliquam eleifend. Vitae sapien pellentesque habitant morbi tristique. Dis parturient montes nascetur ridiculus. Egestas egestas fringilla phasellus faucibus scelerisque eleifend. Aliquam faucibus purus in massa tempor nec feugiat nisl.',
--     101
--   ),
--   (
--     'The most boring article about cats you''ll ever read',
--     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
--     102
--   ),
--   (
--     '7 things lady gaga has in common with cats',
--     'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Velit egestas dui id ornare arcu odio. Molestie at elementum eu facilisis sed odio morbi. Tempor nec feugiat nisl pretium. At tempor commodo ullamcorper a lacus. Egestas dui id ornare arcu odio. Id cursus metus aliquam eleifend. Vitae sapien pellentesque habitant morbi tristique. Dis parturient montes nascetur ridiculus. Egestas egestas fringilla phasellus faucibus scelerisque eleifend. Aliquam faucibus purus in massa tempor nec feugiat nisl.',
--     103
--   ),
--   (
--     'The most incredible article about cats you''ll ever read',
--     'Lorem ipsum dolor sit amet, boring consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
--     100
--   ),
--   (
--     '10 ways cats can help you live to 100',
--     'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Velit egestas dui id ornare arcu odio. Molestie at elementum eu facilisis sed odio morbi. Tempor nec feugiat nisl pretium. At tempor commodo ullamcorper a lacus. Egestas dui id ornare arcu odio. Id cursus metus aliquam eleifend. Vitae sapien pellentesque habitant morbi tristique. Dis parturient montes nascetur ridiculus. Egestas egestas fringilla phasellus faucibus scelerisque eleifend. Aliquam faucibus purus in massa tempor nec feugiat nisl.',
--     101
--   ),
--   (
--     '9 reasons you can blame the recession on cats',
--     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
--     102
--   ),
--   (
--     '10 ways marketers are making you addicted to cats',
--     'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Velit egestas dui id ornare arcu odio. Molestie at elementum eu facilisis sed odio morbi. Tempor nec feugiat nisl pretium. At tempor commodo ullamcorper a lacus. Egestas dui id ornare arcu odio. Id cursus metus aliquam eleifend. Vitae sapien pellentesque habitant morbi tristique. Dis parturient montes nascetur ridiculus. Egestas egestas fringilla phasellus faucibus scelerisque eleifend. Aliquam faucibus purus in massa tempor nec feugiat nisl.',
--     103
--   ),
--   (
--     '11 ways investing in cats can make you a millionaire',
--     'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
--     100
--   ),
--   (
--     'Why you should forget everything you learned about cats',
--     'Posuere sollicitudin aliquam ultrices sagittis orci a. Feugiat sed lectus vestibulum mattis ullamcorper velit. Odio pellentesque diam volutpat commodo sed egestas egestas fringilla. Velit egestas dui id ornare arcu odio. Molestie at elementum eu facilisis sed odio morbi. Tempor nec feugiat nisl pretium. At tempor commodo ullamcorper a lacus. Egestas dui id ornare arcu odio. Id cursus metus aliquam eleifend. Vitae sapien pellentesque habitant morbi tristique. Dis parturient montes nascetur ridiculus. Egestas egestas fringilla phasellus faucibus scelerisque eleifend. Aliquam faucibus purus in massa tempor nec feugiat nisl.',
--     101
--   );


-- INSERT INTO tags (name) VALUES 
--   ('foo'),
--   ('bar'),
--   ('baz'),
--   ('qux');

-- INSERT INTO notes_tags (note_id, tag_id) VALUES 
-- (1001, 1),
-- (1002, 1), (1002, 2),
-- (1003, 1), (1003, 2), (1003, 3),
-- (1004, 1), (1004, 2), (1004, 3), (1004, 4),
-- (1005, 2),
-- (1006, 2), (1006, 3), (1006, 4),
-- (1007, 3),
-- (1008, 3), (1008, 4),
-- (1009, 4);

-- -- get all notes
-- SELECT * FROM notes;

-- -- get all folders
-- SELECT * FROM folders;

-- -- get all tags 
-- SELECT * FROM tags;

-- -- get all notes with folders
-- SELECT * FROM notes
-- INNER JOIN folders ON notes.folder_id = folders.id;

-- -- get all notes, show folders if they exists otherwise null
-- SELECT * FROM notes
-- LEFT JOIN folders ON notes.folder_id = folders.id;

-- -- get all notes,
-- -- show folders if they exists otherwise null
-- -- show tags if they exists otherwise null
-- SELECT * FROM notes
-- LEFT JOIN folders ON notes.folder_id = folders.id
-- LEFT JOIN notes_tags ON notes.id = notes_tags.note_id
-- LEFT JOIN tags ON notes_tags.tag_id = tags.id;
