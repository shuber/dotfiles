;;; databases.el -*- lexical-binding: t; -*-

(setq sql-connection-alist
      '((consumer (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "shuber")
                  (sql-password "")
                  (sql-database "lendinghome_dev"))
        (datacabana (sql-product 'postgres)
                  (sql-port 54321)
                  (sql-server "localhost")
                  (sql-user "postgres")
                  (sql-password "postgres")
                  (sql-database "postgres"))
        (posto (sql-product 'postgres)
                (sql-port 5432)
                (sql-server "localhost")
                (sql-user "shuber")
                (sql-password "")
                (sql-database "post_origination_dev"))))


(defun db-consumer ()
  (interactive)
  (sql-connect 'consumer))

(defun db-datacabana ()
  (interactive)
  (sql-connect 'datacabana))

(defun db-posto ()
  (interactive)
  (sql-connect 'posto))
