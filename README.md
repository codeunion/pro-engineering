# Rails, TDD, and Professional Engineering

Welcome to CodeUnion's _Rails, TDD, and Professional Engineering_ workshop. If
you're reading this, it means you've decided to take a bit of a risk with us. We
appreciate that and promise to reward you with a fun, rewarding, and positive
learning experience.

## Contents

- [Overview](#overview)
- [Logistics](#logistics)
- [Sprints](#sprints)
- [Focus](#focus)
- [Expectations](#expectations)
    - [Students should expect that teachers will...](#students-should-expect-that-teachers-will)
    - [We expect that students will...](#we-expect-that-students-will)
    - [Professional Coding Expectations](#professional-coding-expectations)

## Overview

The _Professional Engineering_ is intended for students looking to become
full-time, professional software engineers and emphasizes the "craft" of
software engineering.  At the end of the workshop, students should be employable
as a junior-level software engineer (if that's what they want).  For students
looking to really shine in interviews and on the job, we strongly recommend they
also take our _Topics in CS_ workshop.

We expect students coming into this workshop understand the HTTP
request/response cycle and have some experience deploying web applications (in
any language or framework).  Students should know their way around the
command-line and have experience with `git` and GitHub.

## Logistics And Format

We'll have two 2-hour group sessions per week.  Your teachers will send out an
email before the workshop begins asking you to figure out a schedule.

For the duration of the course we will [mob program](http://mobprogramming.org)
on a [group project](https://github.com/zipshare/zipshare). This group project
has us:
  * Working on a project for a (simulated) reasonably mature product company.
  * Collaborating on a project both asynchronously and synchronously.
  * Developing an application that spans multiple code bases.
  * Implementing business-critical features such as payment processing, data
    security, multi-application APIs, etc.
  * Writing well-tested, well-documented, working code.
  * Building progressively-enhanced rich user interfaces

Working on your own side-projects is strongly encouraged throughout the program,
however we will not be discussing side-projects during group sessions. Instead,
request feedback on your side projects or ask questions about them in Slack.

## Focus

In this workshop, "fidelity to working environment" is _essential_.  This means
that whenever possible students and teachers should...

1. Use frameworks, libraries, and tools commonly found in a professional working
   environment.
1. Communicate, collaborate, and otherwise interact as honest-to-goodness
   software engineers would.
1. Best practices, best practices, best practices.

## Expectations

### Students should expect that teachers will...

1. Reply to requests for feedback within *at most* 48 hours
1. Receive *all* feedback from students with gratitude and grace — personal,
   professional, or otherwise.
1. Give specific, actionable, and encouraging feedback.
1. Actively foster a learning environment that empowers their students.

### We expect that students will...

1. Dedicate a minimum of 20 hours / week coding — and that means
   hands-on-keyboard coding, not, say, thinking about coding while in the shower.
1. Proactively and regularly seek feedback on their code, no matter how
   incomplete, inelegant, or unpolished they consider it.
1. Clearly communicate expectations and inform teachers when those expectations
   aren't being met.
1. Treat their teachers and fellow students with respect and be sensitive to
   differences in background, life circumstances, and culture.

Consider these expectations binding.  If you, as a student, feel we're not
living up to our end of the bargin, you should feel comfortable pointing it out
and expect a grateful, gracious, and honest response.

### Professional Coding Expectations

The biggest difference between the _Professional Engineering_ workshop and our
other workshops is the level of professionalism we expect.  If your code didn't
meet these standards in a professional engineering environment, you'd likely be
told to re-write it before anyone even looked at it. Trust us: employers will
love, love, love anyone who can consistently meet them.

Here's what this means in concrete terms.

1. All code should be shared via GitHub.
1. A developer should be able to explain what each line of their code does and
   justify their choices.
1. All code should handle error conditions gracefully.  What counts as
   "graceful" depends on the context, of course.
1. All code should be accompanied with well-written automated tests.  In Ruby,
   these test should be written in RSpec and follow the [RSpec Style
   Guidelines](http://betterspecs.org/).
1. All code should _either_ be runnable directly from a fresh `git clone` _or_
   be accompanied with documentation describing how to run the code (in sufficient
   detail) _regardless of environment_.
1. All Ruby code should adhere to [bbatsov's Ruby Style
   Guide](https://github.com/bbatsov/ruby-style-guide).
1. All Rails code should adhere to [bbatsov's Rails Style
   Guide](https://github.com/bbatsov/rails-style-guide).
1. Students and teachers should collaborate using a typical workflow:
   topic-branch -> pull request -> code review -> merge or refactor.
1. Student and teacher commits should follow "best practices".  At a minimum,
   that means:
  + Small, logically cohesive commits
  + Detailed commit messages that provide sufficient context, e.g., no messages
    like "edited whatever.rb"
  + Attention to white space errors (excess space at end of line, no newline at
    end of file, etc.)
  + Appropriate use of `.gitignore`.  Did you accidentally commit your
    development database?  Oops.
  + No unintentional or noisy commits, e.g., files added to commit that
    Shouldn't have been added, debugging statements left in code (even if
    Commented out), irrelevant changes to whitespace that introduce commit noise,
    Etc.

As in a professional environment, you can "miss" these expectations a few times,
we'd rather not mention it more than two or three times.  These will _always_ be
the first things we point out in your code, too, so the fewer of these
expectations your code meets, the less feedback you'll get on other parts of
your code.

There's an upside: code that meets these expectations is _much_ easier to review
and debug.
