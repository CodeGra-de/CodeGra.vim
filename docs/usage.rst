Using the Vim Plugin
========================
After installation, the mounted folder (e.g. ``mnt/``) can be opened in Vim to
make use of the plugin with the command ``vim mnt/``.
The following commands are available in Vim when editing a file in the CodeGrade
filesystem:

+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| Command              | ``--fixed`` | Description                                                                                      |
+======================+=============+==================================================================================================+
| CGEditFeedback       | ✓           | Edit the current submission's global feedback.                                                   |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGEditGrade          | ✓           | Edit the current submission's grade.                                                             |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGShowLineFeedback   | ✗           | Show the line-feedback for the current buffer in the quickfix list and open the quickfix window. |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGEditLineFeedback   | ✓           | Edit the comment for the current line in the current buffer.                                     |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGDeleteLineFeedback | ✓           | Delete the comment for the current line in the current buffer.                                   |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGOpenRubricEditor   | ✗           | Edit the rubric of the assignment of the current file.                                           |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGOpenRubricSelector | ✓           | Open the rubric for the current submission.                                                      |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGRubricPrevSection  | ✗           | Go to the previous header in a rubric file.                                                      |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGRubricNextSection  | ✗           | Go to the next header in a rubric file.                                                          |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+
| CGRubricSelectItem   | ✓           | Select the rubric item on the current line.                                                      |
+----------------------+-------------+--------------------------------------------------------------------------------------------------+

.. note:: The ``--fixed`` flag when mounting is required to use specific commands.
